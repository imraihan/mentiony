/*
 * Written by: Luat Nguyen(luatnd) on 2016/05/27
 *
 * Edited and Extended By Ahmed Raihan 2018/01/02
 
 */
var tmpEle = null;

(function ($) {
    var KEY = {
        AT:              64,
        HASH :           35,
        BACKSPACE:       8,
        DELETE:          46,
        TAB:             9,
        ESC:             27,
        RETURN:          13,
        LEFT:            37,
        UP:              38,
        RIGHT:           39,
        DOWN:            40,
        SPACE:           32,
        HOME:            36,
        END:             35,
        COMMA:           188,
        NUMPAD_ADD:      107,
        NUMPAD_DECIMAL:  110,
        NUMPAD_DIVIDE:   111,
        NUMPAD_ENTER:    108,
        NUMPAD_MULTIPLY: 106,
        NUMPAD_SUBTRACT: 109,
        PAGE_DOWN:       34,
        PAGE_UP:         33,
        PERIOD:          190,
    };

    jQuery.fn.mentiony = function (method, options) {
        var defaults = {
            debug:              0, // Set 1 to see console logUser message of this plugin

            /**
             * True [default] will make mention area size equal to initial size of textarea. NOTE: Textarea must visible on document ready if this value is true.
             * False will not specify the CSS width attribute to every mention area.
             */
            applyInitialSize:   true,

            globalTimeout:      null, // Don't overwrite this config
            timeOut:            400, // Do mention only when user input idle time > this value
            triggerChar1:        '@', // @keyword-to-mention
            triggerChar2:        '#', // @keyword-to-mention

            /**
             * Function for mention data processing
             * @param mode
             * @param keyword
             * @param onDataRequestCompleteCallbackUser
             */
            onDataRequestUser: function (mode, keyword, onDataRequestCompleteCallbackUser, triggertype,check_local) {

            },

            /**
             * Addition keyboard event handle for old and new input
             * Why we need this:
             *  • Because some original js was binded to textarea, we need to bind it to contenteditable too.
             *  • Useful when you wanna passing some event trigger of old element to new editable content
             *  • Old input element already be trigger some event, then you need to pass some needed event to new editable element
             * @param event
             * @param oldInputEle
             * @param newEditableEle
             */
            onKeyPress: function (event, oldInputEle, newEditableEle) {
                oldInputEle.trigger(event);
            },
            onKeyUp:    function (event, oldInputEle, newEditableEle) {
                oldInputEle.trigger(event);
            },
            onBlur:     function (event, oldInputEle, newEditableEle) {
                oldInputEle.trigger(event);
            },
            onPaste:    function (event, oldInputEle, newEditableEle) {
                oldInputEle.trigger(event);
            },
            onInput: function (oldInputEle, newEditableEle) {

            },

            // adjust popover relative position with its parent.
            popoverOffset:      {
                x: -30,
                y: 0
            },

                templates:          {
                container:        '<div id="mentiony-container" class="mentiony-container"></div>',
                content:          '<div id="mentiony-content" class="mentiony-content" contenteditable="true"></div>',
                popover:          '<div id="mentiony-popover" class="mentiony-popover"></div>',
                list:             '<ul id="mentiony-popover" class="mentiony-list"></ul>',
                listItem:         '<li class="mentiony-item" data-item-id="">' +
                                  '<div class="row">' +
                                  '<div class="avatar">' +
                                  '<img src="">' +
                                  '</div>' +
                                  '<div class="main-parent">' +
                                  '<div class="parent">' +
                                  '<p class="title"></p>' +
                                  '</div>' +
                                  '<p class="info-block"></p>' +
                                  '</div>' +
                                  '</li>',
                normalText:       '<span class="normal-text">&nbsp;</span>',
                highlight:        '<span class="highlight"></span>',
                highlightContent: '<a href="[HREF]" data-item-id="[ITEM_ID]" pk="[PK]" class="mentiony-link">[TEXT]<button type="button" class="xMen">x</button></a>',
            }
        };

        if (typeof method === 'object' || !method) {
            options = method;
        }

        var settings = $.extend({}, defaults, options);

        return this.each(function () {
            var instance = $.data(this, 'mentiony_user') || $.data(this, 'mentiony_user', new MentionsInputUser(settings));

            if (typeof instance[method] === 'function') {
                return instance[method].apply(this, Array.prototype.slice.call(outerArguments, 1));
            } else if (typeof method === 'object' || !method) {
                return instance.init.call(this, this);
            } else {
                $.error('Method ' + method + ' does not exist');
            }
        });
    };

    var MentionsInputUser = function (settings) {
        var elmInputBoxContainer, elmInputBoxContent, elmInputBox,
            elmInputBoxInitialWidth, elmInputBoxInitialHeight,
            editableContentLineHeightPx,
            popoverEle, list, elmInputBoxId,
            elmInputBoxContentAbsPosition = {top: 0, left: 0},
            dropDownShowing = false,
            events          = {
                keyDown:  false,
                keyPress: false,
                input:    false,
                keyup:    false,
            },
            currentMention  = {
                keyword:            '',
                jqueryDomNode:      null, // represent jQuery dom data
                mentionItemDataSet: [], // list item json data was store here
                lastActiveNode:     0,
                charAtFound:        true, // tracking @ char appear or not
            }
            ;
        var needMention = false; // Mention state
        var inputId = Math.random().toString(36).substr(2, 6); // generate 6 character rand string

        var onDataRequestCompleteCallbackUser = function (responseData) {
            populateDropdownUser(currentMention.keyword,responseData);
            // populateDropdownUser(currentMention.keyword,responseData, check_local);
        };

        function initTextAreaUser(ele) {
            elmInputBox = $(ele);

            if (elmInputBox.attr('data-mentions-input') == 'true') {
                return;
            } else {
                elmInputBox.attr('data-mentions-input', 'true');

                if (elmInputBox.attr('id').length == 0) {
                    elmInputBoxId = 'mentiony-input-' + inputId;
                    elmInputBox.attr('id', elmInputBoxId);
                } else {
                    elmInputBoxId = elmInputBox.attr('id');
                }
            }


            // Initial UI information
            elmInputBoxInitialWidth = elmInputBox.prop('scrollWidth');
            elmInputBoxInitialHeight = elmInputBox.prop('scrollHeight');

            // Container
            elmInputBoxContainer = $(settings.templates.container.replace('[ID]', inputId));
            elmInputBoxContent = $(settings.templates.content.replace('[ID]', inputId));

            // Make UI and hide the textarea
            var placeholderText = elmInputBox.attr('placeholder');
            if (typeof placeholderText === 'undefined') {
                placeholderText = elmInputBox.text();
            }
            elmInputBoxContent.attr('data-placeholder', placeholderText);

            elmInputBoxContainer.append(elmInputBox.clone().addClass('mention-input-hidden'));
            elmInputBoxContainer.append(elmInputBoxContent);
            elmInputBox.replaceWith(elmInputBoxContainer);

            popoverEle = $(settings.templates.popover.replace('[ID]', inputId));
            list = $(settings.templates.list.replace('[ID]', inputId));
            elmInputBoxContainer.append(popoverEle);
            popoverEle.append(list);

            // Reset the input
            elmInputBox = $('#' + elmInputBoxId);

            // Update initial UI
            var containerPadding = parseInt(elmInputBoxContainer.css('padding'));

            if (settings.applyInitialSize) {
                elmInputBoxContainer.addClass('initial-size');
                elmInputBoxContainer.css({width: (elmInputBoxInitialWidth) + 'px'});
                elmInputBoxContent.width((elmInputBoxInitialWidth - 2 * containerPadding) + 'px');

            }
            else {
                elmInputBoxContainer.addClass('auto-size');
            }

            elmInputBoxContent.css({minHeight: elmInputBoxInitialHeight + 'px'});

            elmInputBoxContentAbsPosition = elmInputBoxContent.offset();
            editableContentLineHeightPx = parseInt($(elmInputBoxContent.css('line-height')).selector);

            // This event occured from top to down.
            // When press a key: onInputBoxKeyDownUser --> onInputBoxKeyPressUser --> onInputBoxInputUser --> onInputBoxKeyUpUser
            elmInputBoxContent.bind('keydown', onInputBoxKeyDownUser);
            elmInputBoxContent.bind('keypress', onInputBoxKeyPressUser);
            elmInputBoxContent.bind('input', onInputBoxInputUser);
            elmInputBoxContent.bind('keyup', onInputBoxKeyUpUser);
            // elmInputBoxContent.bind('click', onInputBoxClickUser);
            elmInputBoxContent.bind('blur', onInputBoxBlurUser);
            elmInputBoxContent.bind('paste', onInputBoxPasteUser);
        }

        /**
         * Put all special key handle here
         * @param e
         */
        function onInputBoxKeyDownUser(e) {
            // logUser('onInputBoxKeyDownUser');

            // reset events tracking
            events = {
                keyDown:  true,
                keyPress: false,
                input:    false,
                keyup:    false,
            };


            if (dropDownShowing) {
                return handleUserChooseOptionUser(e);
            }
        }

        /**
         * Character was entered was handled here
         * This event occur when a printable was pressed. Or combined multi key was handle here, up/down can not read combined key
         * NOTE: Delete key is not be triggered here
         * @param e
         */
        function onInputBoxKeyPressUser(e) {
            // logUser('onInputBoxKeyPressUser');
            events.keyPress = true;

            if (!needMention) {
                // Try to check if need mention
                needMention = (e.keyCode === KEY.AT || e.keyCode === KEY.HASH);
                // logUser(needMention, 'needMention', 'info');
            }

            settings.onKeyPress.call(this, e, elmInputBox, elmInputBoxContent);
        }


        /**
         * When input value was change, with any key effect the input value
         * Delete was trigger here
         */
        function onInputBoxInputUser() {
            // logUser('onInputBoxInputUser');
            events.input = true;

            settings.onInput.call(this, elmInputBox, elmInputBoxContent);
        }

        /**
         * Put all special key handle here
         * @param e
         */
        function onInputBoxKeyUpUser(e) {
            // logUser('onInputBoxKeyUpUser');
            events.keyup = true;
            // logUser(events, 'events');

            if (events.input) {
                updateDataInputDataUser(e);
            }

            if (needMention) {
                // Update mention keyword only inputing(not enter), left, right
                if (e.keyCode !== KEY.RETURN && (events.input || e.keyCode === KEY.LEFT || e.keyCode === KEY.RIGHT)) {
                    updateMentionKeywordUser(e);
                    doSearchAndShowUser();
                }
            }

            settings.onKeyUp.call(this, e, elmInputBox, elmInputBoxContent);
        }

        // function onInputBoxClickUser(e) {
        //     // logUser('onInputBoxClickUser');

        //     if (needMention) {
        //         updateMentionKeywordUser(e);
        //         doSearchAndShowUser();
        //     }
        // }

        function onInputBoxBlurUser(e) {
            // logUser('onInputBoxBlurUser');

            settings.onBlur.call(this, e, elmInputBox, elmInputBoxContent);
        }

        function onInputBoxPasteUser(e) {
            // logUser('onInputBoxPasteUser');

            settings.onPaste.call(this, e, elmInputBox, elmInputBoxContent);
        }

        function onListItemClickUser(e) {
            //$(this) is the clicked listItem
            setSelectedMentionUser($(this));
            choseMentionOptionsUser(true);
        }


        /**
         * Save content to original textarea element, using for form submit to server-side
         * @param e
         */
        function updateDataInputDataUser(e) {
            var elmInputBoxText = elmInputBoxContent.html();
            elmInputBox.val(convertSpaceUser(elmInputBoxText));
            logUser(elmInputBox.val(), 'elmInputBoxText : ');
            tmpEle = elmInputBox;
        }

        /**
         * Trim space and &nbsp; from string
         * @param text
         * @returns {*|void|string|XML}
         */
        function trimSpaceUser(text) {
            return text.replace(/^(&nbsp;|&nbsp|\s)+|(&nbsp;|&nbsp|\s)+$/g, '');
        }

        /**
         * Convert &nbsp; to space
         * @param text
         * @returns {*|void|string|XML}
         */
        function convertSpaceUser(text) {
            return text.replace(/(&nbsp;)+/g, ' ');
        }

        /**
         * Handle User search action with timeout, and show mention if needed
         */
        function doSearchAndShowUser() {

            if (settings.timeOut > 0) {
                if (settings.globalTimeout !== null) {
                    clearTimeout(settings.globalTimeout);
                }
                settings.globalTimeout = setTimeout(function () {
                    settings.globalTimeout = null;

                    settings.onDataRequestUser.call(this, 'search', currentMention.keyword, onDataRequestCompleteCallbackUser, triggertype);

                }, settings.timeOut);

            } else {
                settings.onDataRequestUser.call(this, 'search', currentMention.keyword, onDataRequestCompleteCallbackUser, triggertype);
            }
        }

        /**
         * Build and handle dropdown popover content show/hide
         * @param keyword
         * @param responseData
         */
        function populateDropdownUser(keyword ,responseData, check_local) {
            list.empty();
            currentMention.jqueryDomNode = null;
            currentMention.mentionItemDataSet = responseData;

            if (responseData.length) {
                if (currentMention.charAtFound === true) {
                    showDropDownUser();
                }

                responseData.forEach(function (item, index) {
                    var listItem = $(settings.templates.listItem);
                    listItem.attr('data-item-id', item.id);
                    listItem.find('img:first').attr('src', item.avatar);
                    listItem.find('p.title:first').html(item.name);
                    listItem.find('p.info-block:first').html(item.info);
                    listItem.bind('click', onListItemClickUser);
                    list.append(listItem);
                });

            } else {
                hideDropDownUser();
            }
        }

        /**
         * Show popover box contain result item
         */
        function showDropDownUser() {
            var curAbsPos = getSelectionCoordsUser();
            dropDownShowing = true;
            popoverEle.css({
                display: 'block',
                top:     curAbsPos.y - (elmInputBoxContentAbsPosition.top - $(document).scrollTop()) + (editableContentLineHeightPx + 10),
                left:    curAbsPos.x - elmInputBoxContentAbsPosition.left
            });
        }

        function hideDropDownUser() {
            // document.selectedtextarea = $('textarea').detach();
            // $('body').html(document.selectedtextarea);
            dropDownShowing = false;
            popoverEle.css({display: 'none'});
        }


        /**
         * Handle the event when user choosing / chose.
         * @param e
         * @returns {boolean} Continue to run the rest of code or not. If choosing metion or choosed mention, will stop doing anything else.
         */
        function handleUserChooseOptionUser(e) {
            if (!dropDownShowing) {
                return true;
            }

            if (e.keyCode === KEY.UP || e.keyCode === KEY.DOWN) {
                choosingMentionOptionsUser(e);
                return false;
            }

            // Try to exit mention state: Stop mention if @,#, Home, Enter, Tabs
            if ((e.keyCode === KEY.HOME)
                || (e.keyCode === KEY.RETURN)
                || (e.keyCode === KEY.TAB)
            ) {
                choseMentionOptionsUser();
                return false;
            }

            return true;
        }

        /**
         * Update mention keyword on: Input / LEFT-RIGHT
         */
        function updateMentionKeywordUser(e) {
            if (document.selection) {
                // var node = document.selection.createRange().parentElement(); // IE
                var node = document.selection.createRange(); // IE
                // TODO: Test on IE
            } else {
                // var node = window.getSelection().anchorNode.parentNode; // everyone else
                var node = window.getSelection().anchorNode; // everyone else
            }

            var textNodeData = node.data;
            if (typeof textNodeData === 'undefined') {
                textNodeData = '';
            }
            var cursorPosition = getSelectionEndPositionInCurrentLineUser(); // passing the js DOM ele

            // Save current position for mouse click handling, because when you use mouse, no selection was found.
            currentMention.lastActiveNode = node;

            // reset and set new mention keyword
            currentMention.keyword = '';

            var i = cursorPosition - 1; // NOTE: cursorPosition is Non-zero base
            var next = true;
            while (next) {
                var charAt = textNodeData.charAt(i);
                if (charAt === '' || charAt === settings.triggerChar1 || charAt === settings.triggerChar2) {
                    if(charAt === settings.triggerChar1 || charAt === settings.triggerChar2){
                        triggertype = charAt;
                    }
                    next = false;
                }
                i--;
            }

            currentMention.keyword = textNodeData.substring(i + 1, cursorPosition);
            if (currentMention.keyword.indexOf(settings.triggerChar1) === -1 && currentMention.keyword.indexOf(settings.triggerChar2) === -1) {
                currentMention.keyword = '';
                currentMention.charAtFound = false;

                // NOTE: Still need mention but turn off dropdown now
                hideDropDownUser();
            } else {
                currentMention.keyword = currentMention.keyword.substring(1, cursorPosition);
                currentMention.charAtFound = true;
            }

            logUser(currentMention.keyword, 'currentMention.keyword');
        }

        function getMentionKeywordUser() {
            return currentMention.keyword;
        }

        /**
         * Update UI, show the selected item
         * @param item Jquery object represent the list-item
         */
        function setSelectedMentionUser(item) {
            currentMention.jqueryDomNode = item;
            updateSelectedMentionUI(item);

            logUser(item, 'setSelectedMentionUser item: ');
        }

        function updateSelectedMentionUI(selectedMentionItem) {
            $.each(list.children(), function (i, listItem) {
                $(listItem).removeClass('active');
            });
            selectedMentionItem.addClass('active');
        }

        /**
         * Handle when user use keyboard to choose mention
         * @param e
         */
        function choosingMentionOptionsUser(e) {
            logUser('choosingMentionOptionsUser');

            // Get Selected mention Item
            if (currentMention.jqueryDomNode === null) {
                setSelectedMentionUser(list.children().first());
            }

            var item = [];

            if (e.keyCode === KEY.DOWN) {
                item = currentMention.jqueryDomNode.next();
            } else if (e.keyCode === KEY.UP) {
                item = currentMention.jqueryDomNode.prev();
            }

            if (item.length === 0) {
                item = currentMention.jqueryDomNode;
            }

            setSelectedMentionUser(item);
        }

        /**
         * Handle UI and data when user chose an mention option.
         */
        function choseMentionOptionsUser(chooseByMouse) {
            if (chooseByMouse === 'undefined') {
                chooseByMouse = false;
            }
            logUser('choosedMentionOptions by ' + (chooseByMouse ? 'Mouse' : 'Keyboard'));

            var currentMentionItemData = {};

            var selectedId = currentMention.jqueryDomNode.attr('data-item-id');
            for (var i = 0, len = currentMention.mentionItemDataSet.length; i < len; i++) {
                if (selectedId == currentMention.mentionItemDataSet[i].id) {
                    currentMentionItemData = currentMention.mentionItemDataSet[i];
                    break;
                }
            }
            var tempV = sessionStorage.getItem('targetId');
            var highlightNode = $(settings.templates.highlight);
            var highlightContentNode = $(settings.templates.highlightContent
                .replace('[HREF]', currentMentionItemData.href)
                .replace('[TEXT]', '<span class="triggertype">' + triggertype + '</span>' + currentMentionItemData.name)
                .replace('[ITEM_ID]', currentMentionItemData.id)
                .replace('[PK]', currentMentionItemData.pk)
            );
            highlightNode.append(highlightContentNode);
            replaceTextInRangeUser(triggertype+''+currentMention.keyword, highlightNode.prop('outerHTML'), chooseByMouse);
            // replaceTextInRangeUser('@'+currentMention.keyword, highlightNode.prop('outerHTML'), chooseByMouse);




            // Finish mention
            logUser('Finish mention', '', 'warn');

            needMention = false; // Reset mention state
            currentMention.keyword = ''; // reset current Data if start with @

            hideDropDownUser();
            updateDataInputDataUser();
        }

        function logUser(msg, prefix, level) {
            if (typeof level === 'undefined') {
                level = 'logUser';
            }
            if (settings.debug === 1) {
                eval("console." + level + "(inputId, prefix ? prefix + ':' : '', msg);");
            }
        }

        /**
         * Intend to replace current @key-word with mention structured HTML
         * NOTE: depend on jQuery
         * @param fromString
         * @param toTextHtml
         * @param choosedByMouse
         */
        function replaceTextInRangeUser(fromString, toTextHtml, choosedByMouse) {
            var positionInfo = {
                startBefore: 0,
                startAfter:  0,
                stopBefore:  0,
                stopAfter:   0,
            };

            var sel = window.getSelection();
            var range;


            // Move caret to current caret in case of contentediable is not active --> no caret

            if (choosedByMouse !== 'undefined' && choosedByMouse === true) {
                var lastActiveNode = currentMention.lastActiveNode;
                try {
                    var offset = lastActiveNode.data.length;
                } catch (e) {
                    logUser(e, 'lastActiveNode Error:');
                    var offset = 0;
                }

                range = document.createRange();
                range.setStart(lastActiveNode, offset);
                range.collapse(true);
                sel.removeAllRanges();
                sel.addRange(range);

                // TODO: Bug: Choose mention by mouse: @123456: IF user put caret between 2 & 3 THEN the highlight will replace only 3456
            }

            var isIE = false;

            var stopPos = sel.focusOffset;
            var startPos = stopPos - fromString.length;

            if (window.getSelection) {
                isIE = false;
                sel = window.getSelection();
                if (sel.rangeCount > 0) {
                    range = sel.getRangeAt(0).cloneRange();
                    range.collapse(true);
                }
            } else if ((sel = document.selection) && sel.type != "Control") {
                range = sel.createRange();
                isIE = true;
            }

            if (startPos !== stopPos) { // try this without select the input
                // replace / Remove content
                range.setStart(sel.anchorNode, startPos);
                range.setEnd(sel.anchorNode, stopPos);
                range.deleteContents();
            }

            // insert
            var node = document.createElement('span');
            node.setAttribute('class', 'mention-area');
            node.innerHTML = toTextHtml;
            range.insertNode(node);
            range.setEnd(sel.focusNode, range.endContainer.length);

            positionInfo.startBefore = startPos;
            positionInfo.stopBefore = stopPos;
            positionInfo.startAfter = startPos;
            positionInfo.stopAfter = startPos + node.innerText.length;


            // move cursor to end of keyword after replace
            var stop = false;
            node = $(sel.anchorNode);
            while (!stop) {
                if (node.next().text().length === 0) {
                    stop = true;
                }
                else {
                    node = node.next();
                }
            }

            // insert <newElem> after list
            var newElem = $(settings.templates.normalText).insertAfter(node);

            // move caret to after <newElem>
            range = document.createRange();
            range.setStartAfter(newElem.get(0));
            range.setEndAfter(newElem.get(0));
            sel.removeAllRanges();
            sel.addRange(range);

            return positionInfo;
        }


        // Public methods
        return {
            init: function (domTarget) {
                initTextAreaUser(domTarget);
            },
        };
    };


    /**
     * Get current caret / selection absolute position (relative to viewport , not to parent)
     * Thank to Tim Down: http://stackoverflow.com/questions/6846230/coordinates-of-selected-text-in-browser-page
     * NOTE: This is relative to viewport, not its parent
     * @param win
     * @returns {{x: number, y: number}}
     */
    function getSelectionCoordsUser(win) {
        win = win || window;
        var doc = win.document;
        var sel = doc.selection, range, rects, rect;
        var x = 0, y = 0;
        if (sel) {
            if (sel.type != "Control") {
                range = sel.createRange();
                range.collapse(true);
                x = range.boundingLeft;
                y = range.boundingTop;
            }
        } else if (win.getSelection) {
            sel = win.getSelection();
            if (sel.rangeCount) {
                range = sel.getRangeAt(0).cloneRange();

                if (range.getClientRects) {
                    range.collapse(true);
                    rects = range.getClientRects();
                    if (rects.length > 0) {
                        rect = rects[0];
                    }
                    x = rect.left;
                    y = rect.top;
                }
                // Fall back to inserting a temporary element
                if (x == 0 && y == 0) {
                    var span = doc.createElement("span");
                    if (span.getClientRects) {
                        // Ensure span has dimensions and position by
                        // adding a zero-width space character
                        span.appendChild(doc.createTextNode("\u200b"));
                        range.insertNode(span);
                        rect = span.getClientRects()[0];
                        x = rect.left;
                        y = rect.top;
                        var spanParent = span.parentNode;
                        spanParent.removeChild(span);

                        // Glue any broken text nodes back together
                        spanParent.normalize();
                    }
                }
            }
        }
        return {x: x, y: y};
    }

    /**
     * Get current caret position in current line (not the current contenteditable)
     * @returns {number}
     */
    function getSelectionEndPositionInCurrentLineUser() {
        var selectionEndPos = 0;
        if (window.getSelection) {
            var sel = window.getSelection();
            selectionEndPos = sel.focusOffset;
           
        }

        return selectionEndPos;
    }

    // TODO: Add setting option: showMentionedItem :Filter mentioned item, we should not show a item if it already mentioned
    // TODO: Elastic search in case of local data (in case of ajax --> depend on server-side)
    // TODO: Use higlight
    // TODO: Dropdown: scroll to see more item WHEN user press DOWN and reach the end of list.
    // TODO: Change to A cross-browser JavaScript range and selection library.: https://github.com/timdown/rangy

}(jQuery));
