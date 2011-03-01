var Desktop = {
    IS_DESKTOP: "isdtp"
};
function dashify(str){
    return str.replace(/([a-z])([A-Z])/g, "$1-$2").toLowerCase();
}
function getCurrentStyle(element, styleProp){
    var retVal;
    if (element.currentStyle){
        retVal = element.currentStyle[styleProp];
    } else if (document.defaultView && document.defaultView.getComputedStyle) {
        var computedStyle = document.defaultView.getComputedStyle(element,null);
        retVal = computedStyle ? computedStyle.getPropertyValue(dashify(styleProp)) : null;
    } else {
        retVal = null;
    }
    return retVal;
}
function LC() {}
LC.isRtlPage = function () {
    return getCurrentStyle(document.body, "direction") == "rtl";
};
function alertBlockSubmit(msg) {
    window.ffInAlert = true;
    alert(msg);
    window.ffInAlert = false;
}

function Modal() {}
Modal.confirm = function(msg) {
    top.ffInAlert = true;
    var ans = window.confirm(msg);
    top.ffInAlert = false;
    return ans;
};
Modal.isBlocked = function() {
    return top.ffInAlert;
};

function navigateToUrl(url) {
    window.location = url;
}

function getElementByIdCS(id) {
    return getElementByIdCSWithDoc(document, id);
}

function getElementByIdCSWithDoc(doc, id) {
    var el = doc.getElementById(id);
    if (el == null || el.id == id) return el;

    if (doc.all) {
        return doc.all[id];
    }
    return null;
}

function getObjX(obj) {
    var x = 0;
    var offset = obj;
    while (offset != null) {
        x += offset.offsetLeft;
        offset = offset.offsetParent;
    }
    return x;
}

function getObjY(obj) {
    var y = 0;
    var offset = obj;
    while (offset != null) {
        y += offset.offsetTop;
        offset = offset.offsetParent;
    }
    return y;
}

function DomUtil() {}
DomUtil.walkDomTreeApplyingFunction = function(node, funk) {
    if (!node) {
        return null;
    }
    var ans = funk(node);
    if (ans) {
        return ans;
    } else {
        if (node.firstChild) {
            for (var i = 0; i < node.childNodes.length; i++) {
                ans = DomUtil.walkDomTreeApplyingFunction(node.childNodes[i], funk);
                if (ans) {
                    return ans;
                }
            }
        }
    }
    return null;
};
DomUtil.findDescendantWithTag = function(startNode, tagType) {
    return DomUtil.findDescendantWithProperty(startNode, "tagName", tagType, true);
};

DomUtil.findDescendantWithProperty = function(startNode, property, value, caseInSensitive) {
    if (caseInSensitive) {
        var lowerVal = value.toLowerCase();
        return DomUtil.walkDomTreeApplyingFunction(startNode, function(node) {
            if (node[property] && node[property].toLowerCase && (node[property].toLowerCase() == lowerVal)) {
                return node;
            } else {
                return null;
            }
        });
    } else {
        return DomUtil.walkDomTreeApplyingFunction(startNode, function(node) {
            if ((node[property] == value)) {
                return node;
            } else {
                return null;
            }
        });
    }
};

DomUtil.findDescendantWithClassName = function(startNode, className) {
    if (!className) {
        return;
    }
    var spacedClass = " " + className + " ";
    return DomUtil.walkDomTreeApplyingFunction(startNode, function(node) {
        if (node.className && ((" " + node.className + " ").indexOf(spacedClass) > -1)) {
            return node;
        } else {
            return null;
        }
    });
};

function RelatedList(id, visibleRowCount, title, hasMore, refURL, refQS, onlySkipLink, shouldLoad, listCommonId) {
    this.listId = id;
    if (visibleRowCount) {
        this.visibleRowCount = visibleRowCount;
    }
    if (title) {
        this.title = title;
    }
    if (typeof hasMore != "undefined") {
        this.listHasMore = hasMore;
    }
    if (refURL) {
        this.refreshURL = refURL;
    }
    if (refQS) {
        this.refreshQS = refQS;
    }
    if (onlySkipLink) {
        this.isOnlySkipLink = onlySkipLink;
    }
    this.shouldLoad = shouldLoad;
    this.listCommonId = listCommonId;
}
RelatedList.prototype.getRelatedListNode = function() {
    return document.getElementById(this.listId);
};
RelatedList.prototype.getLinkTarget = function() {
    return this.listId + "_target";
};
RelatedList.prototype.getTitle = function() {
    if (!this.title) {
        var titleNode = DomUtil.findDescendantWithTag(this.getRelatedListNode(), "H3");
        if ((titleNode) && (titleNode.innerHTML)) {
            this.title = titleNode.innerHTML;
        } else {
            this.title = "";
        }
    }
    return this.title;
};

RelatedList.prototype.hasMore = function() {
    if (this.listHasMore == null) {
        this.listHasMore = DomUtil.findDescendantWithClassName(this.getRelatedListNode(), "pShowMore");
        if (!this.listHasMore) {
            this.listHasMore = false;
        }
    }
    return this.listHasMore;
};
RelatedList.prototype.getNumberVisibleRows = function() {
    if (!this.visibleRowCount) {
        var rowCount = 0;
        DomUtil.walkDomTreeApplyingFunction(this.getRelatedListNode(), function(node) {
            if (node.className && node.className.indexOf && (node.className.indexOf("dataRow") >= 0 && node.className.indexOf("extraRow") < 0)) {
                rowCount++;
            }
            return null;
        });
        this.visibleRowCount = rowCount;
    }
    return this.visibleRowCount;
};

function RelatedListPanel(rlPanelId) {
    this.panelId = rlPanelId;
    this.currentListId = null;
    this.delayingHide = null;
    this.delayingShow = null;
    this.isIframeInitialized = false;
    this.numLists = 0;
    this.linksHtml = [];
    this.isConsole = location.search.indexOf(Desktop.IS_DESKTOP) > -1;
}
RelatedListPanel.prototype.getPanelNode = function() {
    return document.getElementById(this.panelId);
};
RelatedListPanel.prototype.getPanelShadowNode = function() {
    return (this.getPanelNode()) ? this.getPanelNode().parentNode : null;
};
RelatedListPanel.prototype.getIFrameNode = function() {
    return DomUtil.findDescendantWithTag(this.getPanelNode(), "iframe");
};
RelatedListPanel.prototype.registerList = function(relatedList) {
    this.linksHtml.push(this.getHoverableLinkHTML(relatedList));
};
RelatedListPanel.prototype.addListsToPanel = function() {
    var linksNode = this.getHoverableLinksNode();
    if (linksNode.innerHTML.indexOf("linklet") < 0 && linksNode.nodeName !== ("SCRIPT").toUpperCase()) {
        linksNode.innerHTML = this.linksHtml.join('<span class="pipe"> | </span>');
    }
    linksNode.style.visibility = "visible";
};
RelatedListPanel.prototype.getHoverableLinkHTML = function(relatedList) {
    var buf = [];
    buf.push('<a class="linklet" href="#');
    buf.push(relatedList.getLinkTarget());
    buf.push('" id="');
    buf.push(this.getLinkId(relatedList.listId));
    buf.push('"');
    if (!relatedList.isOnlySkipLink) {
        buf.push(" onmouseover=\"relatedListPanel.showRLDelayed('");
        buf.push(relatedList.listId);
        buf.push("')\" onmouseout=\"relatedListPanel.hideRLDelayed('");
        buf.push(relatedList.listId);
        buf.push("')\" onclick=\"relatedListPanel.hideRL('");
        buf.push(relatedList.listId);
    }
    buf.push('\')"><span class="listTitle">');
    buf.push(relatedList.getTitle());
    buf.push(this.getCountIndicator(relatedList));
    buf.push("</span></a>");
    return buf.join("");
};
RelatedListPanel.prototype.getCountIndicator = function(relatedList) {
    var html = [];
    if (!relatedList.shouldLoad) {
        html.push('<span class="count">[');
        html.push(relatedList.getNumberVisibleRows());
        if (relatedList.hasMore()) {
            html.push('<span class="plus">+</span>');
        }
        html.push("]</span>");
    } else {
        html.push('<span class="count">[...]</span>');
    }
    return html.join("");
};
RelatedListPanel.prototype.getHoverableLinksNode = function() {
    return this.getPanelShadowNode().nextSibling;
};
RelatedListPanel.prototype.showRLDelayed = function(rlId) {
    this.clearhidemenu();
    if (this.currentListId && (this.currentListId != rlId)) {
        this.hideRL(this.currentListId);
        this.populateRL(rlId);
        this.showRL(rlId);
    } else {
        var self = this;
        this.delayingShow = setTimeout(function() {
            self.showRL(rlId);
        }, 500);
        this.populateRL(rlId);
    }
};
RelatedListPanel.prototype.hideRLDelayed = function(rlId, delay) {
    this.clearshowmenu();
    if (!delay) {
        delay = 50;
    }
    if (!rlId) {
        rlId = this.currentListId;
    }
    var self = this;
    this.delayingHide = setTimeout(function() {
        self.hideRL(rlId);
    }, delay);
};
RelatedListPanel.prototype.getStyleSheetHtml = function() {
    var sheetHtml = [];
    for (var i = 0; i < document.styleSheets.length; i++) {
        if (document.styleSheets[i].owningElement && document.styleSheets[i].owningElement.outerHTML) {
            sheetHtml.push(document.styleSheets[i].owningElement.outerHTML);
        }
    }
    return sheetHtml.join("");
};
RelatedListPanel.prototype.populateRL = function(rlId) {
    if (!rlId) {
        rlId = this.currentListId;
    }
    if (this.currentListId != rlId) {
        var panelFrameNode = this.getIFrameNode();
        if (!panelFrameNode) {
            return;
        }
        var relatedListNode = getElementByIdCS(rlId);
        var iFrameDoc = panelFrameNode.contentWindow.document;
        if (!(relatedListNode && iFrameDoc)) {
            return;
        }
        this.currentListId = rlId;
        if (iFrameDoc.importNode) {
            iFrameDoc.body.innerHTML = "";
            iFrameDoc.body.appendChild(iFrameDoc.importNode(relatedListNode, false));
            iFrameDoc.body.firstChild.innerHTML = relatedListNode.innerHTML;
        } else {
            if (relatedListNode.outerHTML) {
                iFrameDoc.body.innerHTML = relatedListNode.outerHTML;
            } else {
                return false;
            }
        }
        var self = this;
        setTimeout(function() {
            //self.fixContent();
        }, 1);
        if (!this.isIframeInitialized) {
            var frameWindow = panelFrameNode.contentWindow;
            frameWindow.navigateToUrl = function(url) {
                window.navigateToUrl(url);
            };
            this.isIframeInitialized = true;
        }
    }
};
RelatedListPanel.prototype.showRL = function(rlId, forceResize) {
    this.clearhidemenu();
    if (rlId != this.currentListId) {
        return;
    }
    var panelShadowNode = this.getPanelShadowNode();
    if (!panelShadowNode) {
        return;
    }
    var panelFrameNode = this.getIFrameNode();
    var linkletNode = getElementByIdCS(this.getLinkId(rlId));
    var relatedListNode = DomUtil.findDescendantWithClassName(getElementByIdCS(rlId), "bPageBlock");
    if (!(panelFrameNode && linkletNode)) {
        return;
    }
    if (linkletNode.className.indexOf("linkletOn") > 0 && (!forceResize)) {
        return;
    }
    panelShadowNode.style.top = (linkletNode.offsetTop + linkletNode.offsetHeight+8) + "px";
    if (this.isConsole) {
        panelShadowNode.style.left = (getObjX(this.getHoverableLinksNode()) - 4) + "px";
        panelShadowNode.style.width = (relatedListNode.offsetWidth - 3) + "px";
    } else {
        if (LC.isRtlPage()) {
            var parentElement = this.getHoverableLinksNode().parentNode;
            panelShadowNode.style.right = (getObjX(parentElement) + parentElement.offsetWidth - (getObjX(this.getHoverableLinksNode()) + this.getHoverableLinksNode().offsetWidth) - 14) + "px";
        } else {
            panelShadowNode.style.left = (getObjX(this.getHoverableLinksNode()) - 14) + "px";
        }
        panelShadowNode.style.width = (relatedListNode.offsetWidth+ 5) + "px";
    }
    panelFrameNode.style.height = (relatedListNode.offsetHeight+1) + "px";
    panelFrameNode.style.width = (relatedListNode.offsetWidth) + "px";
    panelShadowNode.style.display = "block";
    linkletNode.className += " linkletOn";
};
RelatedListPanel.prototype.hideRL = function(rlId) {
    if (!(Modal.isBlocked())) {
        this.clearshowmenu();
        if (!rlId) {
            rlId = this.currentListId;
        }
        this.currentListId = null;
        var panelShadowNode = this.getPanelShadowNode();
        var linklet = getElementByIdCS(this.getLinkId(rlId));
        if (linklet) {
            linklet.className = "linklet";
        }
        if (panelShadowNode) {
            panelShadowNode.style.display = "none";
        }
    }
};
RelatedListPanel.prototype.clearhidemenu = function() {
    if (this.delayingHide) {
        clearTimeout(this.delayingHide);
    }
};
RelatedListPanel.prototype.clearshowmenu = function() {
    if (this.delayingShow) {
        clearTimeout(this.delayingShow);
    }
};
RelatedListPanel.prototype.getLinkId = function(relatedListId) {
    return relatedListId + "_link";
};
RelatedListPanel.prototype.fixContent = function() {
    var targetableTags = ["a", "form"];
    var iframeWin = this.getIFrameNode().contentWindow;
    for (var i = 0, tag; tag = targetableTags[i]; i++) {
        var tags = iframeWin.document.body.getElementsByTagName(tag);
        for (var k = 0, node; node = tags[k]; k++) {
            if (!node.target) {
                node.target = "_parent";
            }
        }
    }
    var scripts = iframeWin.document.body.getElementsByTagName("script");
    for (var i = 0; i < scripts.length; i++) {
        iframeWin.eval(scripts[i].innerHTML);
    }
};
RelatedListPanel.prototype.refresh = function(relatedLists) {
    for (var rl in relatedLists) {
        var relatedList = relatedLists[rl];
        var buf = [];
        var panelList = this.getIFrameNode().contentWindow.document.getElementById(relatedList.listId);
        var newList = document.getElementById(relatedList.listId);
        var linkletNode = document.getElementById(this.getLinkId(relatedList.listId));
        if (panelList && panelList.innerHTML) {
            panelList.innerHTML = newList.innerHTML;
            this.fixContent(panelList);
            if (linkletNode && linkletNode.className && (linkletNode.className.indexOf("linkletOn") > -1)) {
                this.showRL(relatedList.listId, true);
            }
        }
        if (linkletNode) {
            buf.push('<span class="listTitle">');
            buf.push(relatedList.getTitle());
            buf.push(this.getCountIndicator(relatedList));
            buf.push("</span>");
            linkletNode.innerHTML = buf.join("");
        }
    }
};