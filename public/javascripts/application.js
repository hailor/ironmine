YUI.add('irm', function(Y) {

    Y.namespace('irm');

    Y.irm.handleClick = function(){
        Y.one("#content").addClass("ccc");
        alert("hello");
      };
    // {tbody, tr, td, classnames, headers, rowindex, record, column, data, value}
    Y.irm.template = function(o){
       var templateNode = this._parentNode.one("#"+o.column.get("key"));
       if(templateNode){
         return Y.Lang.substitute(unescape(templateNode.get('innerHTML')),o.data);
       }
       else{
           return o.value;
       }
    };

    Y.irm.rownum = function(o){
      return o.rowindex;
    };

}, '0.1.1' /* module version */, {
    requires: ['base']
});



GY.use('node',function(Y){
   Y.all('input[irm_uppercase]').on('keyup', function(){
      this.set('value',this.get('value').toString().toUpperCase());
   });
});

var siteCount = 0;
function add_site_Field(){
    if (siteCount >= 10)
        return false;
    siteCount++;
    var f1 = document.createElement("input");
    f1.type = "text";
    f1.name = "irm_sites[" + siteCount + "][site_code]";
    var f2 = document.createElement("input");
    f2.type = "text";
    f2.name = "irm_sites[" + siteCount + "][name]";
    var f3 = document.createElement("input");
    f3.type = "text";
    f3.name = "irm_sites[" + siteCount + "][description]";

    var span1 = document.createElement("span");
    span1.setAttribute("class","lookupInput");
    var span2 = document.createElement("span");
    span2.setAttribute("class","lookupInput");
    var span3 = document.createElement("span");
    span3.setAttribute("class","lookupInput");

    var cell1=document.createElement("td");// 创建td
    var cell2=document.createElement("td");// 创建td
    var cell3=document.createElement("td");// 创建td
    var row=document.createElement("tr");// 创建tr

    span1.appendChild(f1);
    span2.appendChild(f2);
    span3.appendChild(f3);
    cell1.appendChild(span1);
    cell2.appendChild(span2);
    cell3.appendChild(span3);

    row.appendChild(cell1);
    row.appendChild(cell2);
    row.appendChild(cell3);

    var p = document.getElementById("site_fields");
    p.appendChild(row);
}

function delete_site_last_row(){
   if (siteCount <= 0)
        return false;
   siteCount--;
   var t=document.getElementById('site_fields');
   t.removeChild(t.lastChild);
}