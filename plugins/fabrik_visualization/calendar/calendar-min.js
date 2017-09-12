/*! Fabrik */

var fabrikCalendar=new Class({Implements:[Options],options:{days:["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"],shortDays:["Sun","Mon","Tues","Wed","Thur","Fri","Sat"],months:["January","Feburary","March","April","May","June","July","August","September","October","November","December"],shortMonths:["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sept","Oct","Nov","Dec"],viewType:"month",calendarId:1,tmpl:"default",Itemid:0,colors:{bg:"#F7F7F7",highlight:"#FFFFDF",headingBg:"#C3D9FF",today:"#dddddd",headingColor:"#135CAE",entryColor:"#eeffff"},eventLists:[],listid:0,popwiny:0,timeFormat:"%X",urlfilters:[],url:{add:"index.php?option=com_fabrik&controller=visualization.calendar&view=visualization&task=getEvents&format=raw",del:"index.php?option=com_fabrik&controller=visualization.calendar&view=visualization&task=deleteEvent&format=raw"},monthday:{width:90,height:120},restFilterStart:"na",j3:!1,showFullDetails:!1,readonly:!1,readonlyMonth:!1,dateLimits:{min:"",max:""}},initialize:function(a){this.firstRun=!0,this.el=document.id(a),this.SECOND=1e3,this.MINUTE=60*this.SECOND,this.HOUR=60*this.MINUTE,this.DAY=24*this.HOUR,this.WEEK=7*this.DAY,this.date=new Date,this.selectedDate=new Date,this.entries=$H(),this.droppables={month:[],week:[],day:[]},this.fx={},this.ajax={},"null"!==typeOf(this.el.getElement(".calendar-message"))&&(this.fx.showMsg=new Fx.Morph(this.el.getElement(".calendar-message"),{duration:700}),this.fx.showMsg.set({opacity:0})),this.colwidth={},this.windowopts={id:"addeventwin",title:"add/edit event",loadMethod:"xhr",minimizable:!1,evalScripts:!0,width:380,height:320,onContentLoaded:function(a){a.fitToContent()}.bind(this)},Fabrik.addEvent("fabrik.form.submitted",function(a,b){this.ajax.updateEvents.send(),Fabrik.Windows.addeventwin.close()}.bind(this))},removeFormEvents:function(a){this.entries.each(function(b,c){void 0!==b&&b.formid===a&&this.entries.dispose(c)}.bind(this))},_makeEventRelDiv:function(a,b,c,d){var e,f,g,h,i,j=a.label;b.left===b.left&&b.left,b["margin-left"]===b["margin-left"]&&b["margin-left"];var k=""!==a.colour?a.colour:this.options.colors.entryColor;0===b.startMin&&(b.startMin=b.startMin+"0"),0===b.endMin&&(b.endMin=b.endMin+"0");var l=(b.view&&b.view,{"background-color":this._getColor(k,c),width:b.width,cursor:"pointer","margin-left":b["margin-left"],top:b.top.toInt()+"px",position:"absolute",border:"1px solid #666666","border-right":"0","border-left":"0",overflow:"auto",opacity:.6,padding:"0 4px"});b.height&&(l.height=b.height.toInt()+"px"),b.left&&(l.left=b.left.toInt()+1+"px"),l["max-width"]=b["max-width"]?b["max-width"]-10+"px":"";var m="fabrikEvent_"+a._listid+"_"+a.id;return d&&"monthView"!==b.view&&(m+=d.className.replace(" ","")),"monthView"===b.view&&(l.width-=1),this.options.j3?(i="",a._canDelete&&(i+=this.options.buttons.del),a._canEdit&&!this.options.readonly&&(i+=this.options.buttons.edit),a._canView&&(i+=this.options.buttons.view),g={start:Date.parse(a.startdate_locale).format(this.options.timeFormat),end:Date.parse(a.enddate_locale).format(this.options.timeFormat)},h=Joomla.JText._("PLG_VISUALIZATION_CALENDAR_EVENT_START_END").substitute(g),""!==i&&(h+='<hr /><div class="btn-group" style="text-align:center;display:block">'+i+"</div>"),f=new Element("a",{class:"fabrikEvent label "+a.status,id:m,styles:l,rel:"popover","data-original-title":j+'<button class="close" data-popover="'+m+'">&times;</button>',"data-content":h,"data-placement":"top","data-html":"true","data-trigger":"click"}),this.options.showFullDetails?f.set("data-task","viewCalEvent"):"undefined"!=typeof jQuery&&(jQuery(f).popover(),f.addEvent("click",function(a){this.popOver=f}.bind(this)),f.addEvent("dblclick",function(a){a.stop()}.bind(this)))):(f=new Element("div",{class:"fabrikEvent label",id:m,styles:l}),this.options.showFullDetails?f.set("data-task","viewCalEvent"):f.addEvent("mouseenter",function(b){this.doPopupEvent(b,a,j)}.bind(this))),""!==a.link&&!1===this.options.readonly&&!1===this.options.j3?e=new Element("a",{href:a.link,class:"fabrikEditEvent",events:{click:function(b){if(Fabrik.fireEvent("fabrik.viz.calendar.event",[b]),!a.custom){b.stop();var c={},d=b.target.getParent(".fabrikEvent").id.replace("fabrikEvent_","").split("_");c.rowid=d[1],c.listid=d[0],this.addEvForm(c)}}.bind(this)}}).set("html",j):a.custom?(j=""===j?"click":j,e=new Element("a",{href:a.link,events:{click:function(a){Fabrik.fireEvent("fabrik.viz.calendar.event",[a])}}}).set("html",j)):e=new Element("span").set("html",j),f.adopt(e),f},doPopupEvent:function(a,b,c){var d;this.activeHoverEvent;if(this.popWin){this.activeHoverEvent=a.target.hasClass("fabrikEvent")?a.target:a.target.getParent(".fabrikEvent"),b._canDelete?this.popWin.getElement(".popupDelete").show():this.popWin.getElement(".popupDelete").hide(),b._canEdit?(this.popWin.getElement(".popupEdit").show(),this.popWin.getElement(".popupView").hide()):(this.popWin.getElement(".popupEdit").hide(),this.popWin.getElement(".popupView").show()),d=this.activeHoverEvent?this.activeHoverEvent.getCoordinates():{top:0,left:0};var e=this.popup.getElement("div[class=popLabel]");e.empty(),e.set("text",c),this.activeDay=a.target.getParent();var f=(d.top,this.popWin.getSize().y,{opacity:[0,1],top:[d.top+50,d.top-10]});this.inFadeOut=!1,this.popWin.setStyles({left:d.left+20,top:d.top}),this.fx.showEventActions.cancel().set({opacity:0}).start.delay(500,this.fx.showEventActions,f)}},_getFirstDayInMonthCalendar:function(a){var b=new Date;if(b.setTime(a.valueOf()),a.getDay()!==this.options.first_week_day){var c=a.getDay()-this.options.first_week_day;c<0&&(c=7+c),a.setTime(a.valueOf()-24*c*60*60*1e3)}if(b.getMonth()===a.getMonth())for(;a.getDate()>1;)a.setTime(a.valueOf()-this.DAY);return a},showMonth:function(){var a=new Date;a.setTime(this.date.valueOf()),a.setDate(1),a=this._getFirstDayInMonthCalendar(a);for(var b=this.el.getElements(".monthView tr"),c=1;c<b.length;c++){var d=b[c].getElements("td"),e=0;d.each(function(b){b.setProperties({class:""}),b.addClass(a.getTime()),a.getMonth()!==this.date.getMonth()&&b.addClass("otherMonth"),this.selectedDate.isSameDay(a)&&b.addClass("selectedDay"),b.empty(),b.adopt(new Element("div",{class:"date",styles:{"background-color":this._getColor("#E8EEF7",a)}}).appendText(a.getDate()));var d=0;this.entries.each(function(b){(""!==b.enddate&&a.isDateBetween(b.startdate,b.enddate)||""===b.enddate&&b.startdate.isSameDay(a))&&d++}.bind(this));var f=0;this.entries.each(function(g){if(""!==g.enddate&&a.isDateBetween(g.startdate,g.enddate)||""===g.enddate&&g.startdate.isSameDay(a)){var h=b.getElements(".fabrikEvent").length,i=20,j=b.getElement(".date").getSize().y;i=Math.floor((b.getSize().y-d-j)/d);var k=b.getSize().y*(c-1)+this.el.getElement(".monthView .dayHeading").getSize().y+j;this.colwidth[".monthView"]=this.colwidth[".monthView"]?this.colwidth[".monthView"]:b.getSize().x;var l=b.getSize().x;l=this.colwidth[".monthView"],k+=h*i;var m=l*e,n={view:"monthView","max-width":l};n.top=k,window.ie&&(n.left=m),n.startHour=g.startdate.getHours(),n.endHour=g.enddate.getHours(),n.startMin=g.startdate.getMinutes(),n.endMin=g.enddate.getMinutes(),n["margin-left"]=0,b.adopt(this._makeEventRelDiv(g,n,a,b))}f++}.bind(this)),a.setTime(a.getTime()+this.DAY),e++}.bind(this))}document.addEvent("mousemove",function(a){var b=(a.target,a.client.x),c=a.client.y,d=this.activeArea;if("null"!==typeOf(d)&&"null"!==typeOf(this.activeDay)&&(b<=d.left||b>=d.right||c<=d.top||c>=d.bottom)){if(!this.inFadeOut){var e=this.activeHoverEvent.getCoordinates(),f={opacity:[1,0],top:[e.top-10,e.top+50]};this.fx.showEventActions.cancel().start.delay(500,this.fx.showEventActions,f)}this.activeDay=null}}.bind(this)),this.entries.each(function(a){this.el.getElement(".fabrikEvent_"+a._listid+"_"+a.id)}.bind(this)),this._highLightToday(),this.el.getElement(".monthDisplay").innerHTML=this.options.months[this.date.getMonth()]+" "+this.date.getFullYear()},_makePopUpWin:function(){if(!this.options.readonly){if("null"===typeOf(this.popup)){var a=new Element("div",{class:"popLabel"}),b=new Element("div",{class:"popupDelete"}).set("html",this.options.buttons);this.popup=new Element("div",{class:"popWin",styles:{position:"absolute"}}).adopt([a,b]),this.popup.inject(document.body),this.activeArea=null,this.fx.showEventActions=new Fx.Morph(this.popup,{duration:500,transition:Fx.Transitions.Quad.easeInOut,onCancel:function(){}.bind(this),onComplete:function(a){if(this.activeHoverEvent){var b=this.popup.getCoordinates(),c=this.activeHoverEvent.getCoordinates(),d=window.getScrollTop(),e={};e.left=b.left<c.left?b.left:c.left,e.top=b.top<c.top?b.top:c.top,e.top=e.top-d,e.right=b.right>c.right?b.right:c.right,e.bottom=b.bottom>c.bottom?b.bottom:c.bottom,e.bottom=e.bottom-d,this.activeArea=e,this.inFadeOut=!1}}.bind(this)})}return this.popup}},makeDragMonthEntry:function(a){},removeWeekEvents:function(){var a=this.date.getDay();a-=this.options.first_week_day.toInt();var b=new Date;b.setTime(this.date.getTime()-a*this.DAY);for(var c={},d=this.el.getElements(".weekView tr"),e=1;e<d.length;e++){b.setHours(e-1,0,0),1!==e&&b.setTime(b.getTime()-6*this.DAY);var f=d[e].getElements("td");for(j=1;j<f.length;j++){"null"===typeOf(c[j-1])&&(c[j-1]=[]);var g=f[j];c[j-1].push(g),1!==j&&b.setTime(b.getTime()+this.DAY),g.addClass("day"),"null"!==typeOf(g.retrieve("calevents"))&&g.retrieve("calevents").each(function(a){a.destroy()}),g.eliminate("calevents"),g.className="",g.addClass("day"),g.addClass(b.getTime()-this.HOUR),this.selectedDate.isSameWeek(b)&&this.selectedDate.isSameDay(b)?g.addClass("selectedDay"):g.removeClass("selectedDay")}}return c},showWeek:function(){var a=this.date.getDay();a-=this.options.first_week_day.toInt();var b=new Date;b.setTime(this.date.getTime()-a*this.DAY);var c=new Date;c.setTime(this.date.getTime()-a*this.DAY);var d=new Date;d.setTime(this.date.getTime()+(6-a)*this.DAY),this.el.getElement(".monthDisplay").innerHTML=b.getDate()+"  "+this.options.months[b.getMonth()]+" "+b.getFullYear()+" - ",this.el.getElement(".monthDisplay").innerHTML+=d.getDate()+"  "+this.options.months[d.getMonth()]+" "+d.getFullYear();var e,f,g,h=this.el.getElements(".weekView tr"),j=h[0].getElements("th"),k=this.removeWeekEvents();for(i=0;i<j.length;i++){j[i].className="dayHeading",j[i].addClass(c.getTime()),g=j[i].getStyle("background-color"),f=this.options.shortDays[c.getDay()]+" "+c.getDate()+"/"+this.options.shortMonths[c.getMonth()],e=new Element("div",{styles:{"background-color":this._getColor(g,c)}}).set("text",f),j[i].empty().adopt(e);var l=10,m={},n={},o=k[i];this.entries.each(function(a){var b=new Date(a.startdate_locale),d=new Date(a.enddate_locale);if(""!==a.enddate&&c.isDateBetween(b,d)||""===d&&b.isSameDay(c))for(var e=this._buildEventOpts({entry:a,curdate:c,divclass:".weekView",tdOffset:i}),f=e.startHour;f<=e.endHour;f++)m[f]="null"===typeOf(m[f])?0:m[f]+1}.bind(this));var p=1;Object.each(m,function(a){a>p&&(p=a)}),this.entries.each(function(a){var b=new Date(a.startdate_locale),d=new Date(a.enddate_locale);if(""!==a.enddate&&c.isDateBetween(b,d)||""===d&&b.isSameDay(c)){for(var e=this._buildEventOpts({entry:a,curdate:c,divclass:".weekView",tdOffset:i}),f=e.startHour;f<=e.endHour;f++)n[f]="null"===typeOf(n[f])?0:n[f]+1;var g=0;for(f=e.startHour;f<=e.endHour;f++)n[f]>g&&(g=n[f]);var h=Math.max(0,e.startHour-this.options.open);td=o[h],l=Math.floor((td.getSize().x-p)/(p+1)),e.width=l+"px",e["margin-left"]=g*(l+1);var j=this._makeEventRelDiv(a,e,null,td);j.addClass("week-event"),j.inject(document.body);var k=j.getStyle("padding-left").toInt()+j.getStyle("padding-right").toInt();j.setStyle("width",j.getStyle("width").toInt()-k+"px"),j.store("opts",e),j.store("relativeTo",td),j.store("gridSize",p);var m=td.retrieve("calevents",[]);m.push(j),td.store("calevents",m),j.position({relativeTo:td,position:"upperLeft"})}}.bind(this)),c.setTime(c.getTime()+this.DAY)}},_buildEventOpts:function(a){var b=a.curdate,c=new CloneObject(a.entry,!0,["enddate","startdate"]),d=this.el.getElements(a.divclass+" tr"),e=new Date(c.startdate_locale),f=new Date(c.enddate_locale),g=e.isSameDay(b)?e.getHours()-this.options.open:0;g=g<0?0:g;var h=a.tdOffset;c.label=c.label?c.label:"";var i=d[g+1].getElements("td")[h+1],j=c.startdate.getHours(),k=i.getSize().y;this.colwidth[a.divclass]=this.colwidth[a.divclass]?this.colwidth[a.divclass]:i.getSize().x;var l=this.el.getElement(a.divclass).getElement("tr").getSize().y;colwidth=this.colwidth[a.divclass];var m=colwidth*h;m+=this.el.getElement(a.divclass).getElement("td").getSize().x;var n=Math.ceil(f.getHours()-e.getHours());0===n&&(n=1),e.isSameDay(f)||(n=0!==this.options.open||24!==this.options.close?this.options.close-this.options.open+1:24,e.isSameDay(b)?n=0!==this.options.open||24!==this.options.close?this.options.close-this.options.open+1:24-e.getHours():(e.setHours(0),f.isSameDay(b)&&(n=0!==this.options.open||24!==this.options.close?this.options.close-this.options.open:f.getHours()))),l+=k*g;var o=k*n;f.isSameDay(b)&&(o+=f.getMinutes()/60*k),e.isSameDay(b)&&(l+=e.getMinutes()/60*k,o-=e.getMinutes()/60*k);var p=i.getElements(".fabrikEvent"),q=colwidth/(p.length+1),r=q*p.length;p.setStyle("width",q+"px");a.divclass.substr(1,a.divclass.length);return q-=i.getStyle("border-width").toInt(),a={"z-index":999,"margin-left":r+"px",height:o,view:"weekView","background-color":this._getColor(this.options.colors.headingBg)},a["max-width"]=q+"px",a.left=m,a.top=l,a.color=this._getColor(this.options.colors.headingColor,e),a.startHour=e.getHours(),a.endHour=a.startHour+n,a.startMin=e.getMinutes(),a.endMin=f.getMinutes(),c.startdate.setHours(j),a},removeDayEvents:function(){var a=new Date,b=(new Date).get("gmtoffset").replace(/0+$/,"").toInt(),c=[];a.setTime(this.date.valueOf()),a.setHours(0,0);for(var d=this.el.getElements(".dayView tr"),e=1;e<d.length;e++){a.setHours(e-1+b,0);var f=d[e].getElements("td")[1];"null"!==typeOf(f)&&(c.push(f),f.className="",f.addClass("day"),"null"!==typeOf(f.retrieve("calevents"))&&f.retrieve("calevents").each(function(a){a.destroy()}),f.eliminate("calevents"),f.addClass(a.getTime()-this.HOUR),f.set("data-date",a))}return c},showDay:function(){var a,b=this.el.getElements(".dayView tr");thbg=b[0].childNodes[1].getStyle("background-color"),ht=this.options.days[this.date.getDay()],a=new Element("div",{styles:{"background-color":this._getColor(thbg,this.date)}}).set("text",ht),b[0].childNodes[1].empty().adopt(a);var c=this.removeDayEvents(),d=100,e={},f={};this.entries.each(function(a){if(""!==a.enddate&&this.date.isDateBetween(a.startdate,a.enddate)||""===a.enddate&&a.startdate.isSameDay(firstDate))for(var b=this._buildEventOpts({entry:a,curdate:this.date,divclass:".dayView",tdOffset:0}),c=b.startHour;c<=b.endHour;c++)f[c]="null"===typeOf(f[c])?0:f[c]+1}.bind(this));var g=1;Object.each(f,function(a){a>g&&(g=a)}),this.entries.each(function(a){if(""!==a.enddate&&this.date.isDateBetween(a.startdate,a.enddate)||""===a.enddate&&a.startdate.isSameDay(firstDate)){var b=this._buildEventOpts({entry:a,curdate:this.date,divclass:".dayView",tdOffset:0}),f=Math.max(0,b.startHour-this.options.open);td=c[f],d=Math.floor((td.getSize().x-g)/(g+1)),b.width=d+"px";for(var h=b.startHour;h<=b.endHour;h++)e[h]="null"===typeOf(e[h])?0:e[h]+1;var i=0;for(h=b.startHour;h<=b.endHour;h++)e[h]>i&&(i=e[h]);b["margin-left"]=i*(d+1);var j=this._makeEventRelDiv(a,b,null,td);j.addClass("day-event"),j.store("relativeTo",td),j.store("gridSize",g),j.inject(document.body);var k=j.getStyle("padding-left").toInt()+j.getStyle("padding-right").toInt();j.setStyle("width",j.getStyle("width").toInt()-k+"px"),j.store("opts",b);var l=td.retrieve("calevents",[]);l.push(j),td.store("calevents",l),j.position({relativeTo:td,position:"upperLeft"})}}.bind(this)),this.el.getElement(".monthDisplay").innerHTML=this.date.getDate()+"  "+this.options.months[this.date.getMonth()]+" "+this.date.getFullYear()},renderMonthView:function(){var a,b;this.fadePopWin(0);var c=this._getFirstDayInMonthCalendar(new Date),d=this.options.days.slice(this.options.first_week_day).concat(this.options.days.slice(0,this.options.first_week_day)),e=new Date;if(e.setTime(c.valueOf()),c.getDay()!==this.options.first_week_day){var f=c.getDay()-this.options.first_week_day;e.setTime(c.valueOf()-24*f*60*60*1e3)}if(this.options.viewType="monthView",this.setAddButtonState(),!this.mothView){for(tbody=new Element("tbody",{class:"viewContainerTBody"}),b=new Element("tr"),a=0;a<7;a++)b.adopt(new Element("th",{class:"dayHeading",styles:{width:"80px",height:"20px","text-align":"center",color:this._getColor(this.options.colors.headingColor,e),"background-color":this._getColor(this.options.colors.headingBg,e)}}).appendText(d[a])),e.setTime(e.getTime()+this.DAY);tbody.appendChild(b);for(var g=this.options.colors.highlight,h=this.options.colors.bg,i=this.options.colors.today,j=0;j<6;j++){b=new Element("tr");var k=this;for(a=0;a<7;a++){var l=this.options.colors.bg,m=this.selectedDate.isSameDay(c)?"selectedDay":"";b.adopt(new Element("td",{class:"day "+c.getTime()+m,styles:{width:this.options.monthday.width+"px",height:this.options.monthday.height+"px","background-color":l,"vertical-align":"top",padding:0,border:"1px solid #cccccc"},events:{mouseenter:function(){this.setStyles({"background-color":g})},mouseleave:function(){this.set("morph",{duration:500,transition:Fx.Transitions.Sine.easeInOut});var a=this.hasClass("today")?i:h;this.morph({"background-color":[g,a]})},click:function(a){k.selectedDate.setTime(this.className.split(" ")[1]),k.date.setTime(k._getTimeFromClassName(this.className)),k.el.getElements("td").each(function(a){a.removeClass("selectedDay"),a!==this&&a.setStyles({"background-color":"#F7F7F7"})}.bind(this)),this.addClass("selectedDay")},dblclick:function(a){!1===this.options.readonlyMonth&&this.openAddEvent(a,"month")}.bind(this)}})),c.setTime(c.getTime()+this.DAY)}tbody.appendChild(b)}this.mothView=new Element("div",{class:"monthView",styles:{position:"relative"}}).adopt(new Element("table",{styles:{"border-collapse":"collapse"}}).adopt(tbody)),this.el.getElement(".viewContainer").appendChild(this.mothView)}this.showView("monthView")},setAddButtonState:function(){var a=this.el.getElement(".addEventButton");"null"!==typeOf(a)&&("monthView"===this.options.viewType&&!0===this.options.readonlyMonth?a.hide():a.show())},_getTimeFromClassName:function(a){return a.replace("today","").replace("selectedDay","").replace("day","").replace("otherMonth","").trim()},openAddEvent:function(a,b){var c,e,f,g,h,i,j,k;!1!==this.options.canAdd&&("monthView"===this.options.viewType&&!0===this.options.readonlyMonth||(a.stop(),"addEventButton"===a.target.className?(j=new Date,c=j.getTime()):c=this._getTimeFromClassName(a.target.className),this.dateInLimits(c)&&(a.target.get("data-date")&&console.log("data-date = ",a.target.get("data-date")),this.date.setTime(c),d=0,isNaN(c)||""===c||(k=new Date,k.setTime(c),h=k.getMonth()+1,h=h<10?"0"+h:h,e=k.getDate(),e=e<10?"0"+e:e,"month"!==b?(f=k.getHours(),f=f<10?"0"+f:f,g=k.getMinutes(),g=g<10?"0"+g:g):(f="00",g="00"),this.doubleclickdate=k.getFullYear()+"-"+h+"-"+e+" "+f+":"+g+":00",d="&jos_fabrik_calendar_events___start_date="+this.doubleclickdate),this.options.eventLists.length>1?this.openChooseEventTypeForm(this.doubleclickdate,c):(i={},i.rowid="",i.id="",d="&"+this.options.eventLists[0].startdate_element+"="+this.doubleclickdate,i.listid=this.options.eventLists[0].value,this.addEvForm(i)))))},dateInLimits:function(a){var b=new Date;if(b.setTime(a),""!==this.options.dateLimits.min){if(b<new Date(this.options.dateLimits.min))return alert(Joomla.JText._("PLG_VISUALIZATION_CALENDAR_DATE_ADD_TOO_EARLY")),!1}if(""!==this.options.dateLimits.max){if(b>new Date(this.options.dateLimits.max))return alert(Joomla.JText._("PLG_VISUALIZATION_CALENDAR_DATE_ADD_TOO_LATE")),!1}return!0},openChooseEventTypeForm:function(a,b){var c="index.php?option=com_fabrik&tmpl=component&view=visualization&controller=visualization.calendar&task=chooseaddevent&id="+this.options.calendarId+"&d="+a+"&rawd="+b;c+="&renderContext="+this.el.id.replace(/visualization_/,""),this.windowopts.contentURL=c,this.windowopts.id="chooseeventwin",this.windowopts.onContentLoaded=function(){new Fx.Scroll(window).toElement("chooseeventwin")},Fabrik.getWindow(this.windowopts)},addEvForm:function(a){"undefined"!=typeof jQuery&&jQuery(this.popOver).popover("hide"),this.windowopts.id="addeventwin";var b="index.php?option=com_fabrik&controller=visualization.calendar&view=visualization&task=addEvForm&format=raw&listid="+a.listid+"&rowid="+a.rowid;b+="&jos_fabrik_calendar_events___visualization_id="+this.options.calendarId,b+="&visualizationid="+this.options.calendarId,a.nextView&&(b+="&nextview="+a.nextView),b+="&fabrik_window_id="+this.windowopts.id,void 0!==this.doubleclickdate&&(b+="&start_date="+this.doubleclickdate),this.windowopts.type="window",this.windowopts.contentURL=b;var c=this.options.filters;this.windowopts.onContentLoaded=function(a){c.each(function(a){if(document.id(a.key))switch(document.id(a.key).get("tag")){case"select":document.id(a.key).selectedIndex=a.val;break;case"input":document.id(a.key).value=a.val}}),this.fitToContent(!1)},Fabrik.getWindow(this.windowopts)},_highLightToday:function(){var a=new Date;this.el.getElements(".viewContainerTBody td").each(function(b){var c=new Date(this._getTimeFromClassName(b.className).toInt());a.equalsTo(c)?b.addClass("today"):b.removeClass("today")}.bind(this))},centerOnToday:function(){this.date=new Date,this.showView()},renderDayView:function(){var a,b;if(this.fadePopWin(0),this.options.viewType="dayView",this.setAddButtonState(),!this.dayView){for(tbody=new Element("tbody"),a=new Element("tr"),b=0;b<2;b++)0===b?a.adopt(new Element("td",{class:"day"})):a.adopt(new Element("th",{class:"dayHeading",styles:{width:"80px",height:"20px","text-align":"center",color:this.options.headingColor,"background-color":this.options.colors.headingBg}}).appendText(this.options.days[this.date.getDay()]));for(tbody.appendChild(a),this.options.open=this.options.open<0?0:this.options.open,this.options.close=this.options.close>24||this.options.close<this.options.open?24:this.options.close,i=this.options.open;i<this.options.close+1;i++){for(a=new Element("tr"),b=0;b<2;b++)if(0===b){var c=1===i.length?i+"0:00":i+":00";a.adopt(new Element("td",{class:"day"}).appendText(c))}else a.adopt(new Element("td",{class:"day",styles:{width:"100%",height:"10px","background-color":"#F7F7F7","vertical-align":"top",padding:0,border:"1px solid #cccccc"},events:{mouseenter:function(a){this.setStyles({"background-color":"#FFFFDF"})},mouseleave:function(a){this.setStyles({"background-color":"#F7F7F7"})},dblclick:function(a){this.openAddEvent(a,"day")}.bind(this)}}));tbody.appendChild(a)}this.dayView=new Element("div",{class:"dayView",styles:{position:"relative"}}).adopt(new Element("table",{class:"",styles:{"border-collapse":"collapse"}}).adopt(tbody)),this.el.getElement(".viewContainer").appendChild(this.dayView)}this.showView("dayView")},hideDayView:function(){this.el.getElement(".dayView")&&(this.el.getElement(".dayView").hide(),this.removeDayEvents())},hideWeekView:function(){this.el.getElement(".weekView")&&(this.el.getElement(".weekView").hide(),this.removeWeekEvents())},showView:function(a){switch(this.hideDayView(),this.hideWeekView(),this.el.getElement(".monthView")&&this.el.getElement(".monthView").hide(),this.el.getElement("."+this.options.viewType).style.display="block",this.options.viewType){case"dayView":this.showDay();break;case"weekView":this.showWeek();break;default:case"monthView":this.showMonth()}Cookie.write("fabrik.viz.calendar.view",this.options.viewType)},renderWeekView:function(){var a,b,c,d,e;if(this.fadePopWin(0),e=!1===this.options.showweekends?6:8,this.options.viewType="weekView",this.setAddButtonState(),!this.weekView){for(d=new Element("tbody"),c=new Element("tr"),b=0;b<e;b++)0===b?c.adopt(new Element("td",{class:"day"})):c.adopt(new Element("th",{class:"dayHeading",styles:{width:this.options.weekday.width+"px",height:this.options.weekday.height-10+"px","text-align":"center",color:this.options.headingColor,"background-color":this.options.colors.headingBg},events:{click:function(a){a.stop(),this.selectedDate.setTime(a.target.className.replace("dayHeading ","").toInt());var b=new Date;a.target.getParent().getParent().getElements("td").each(function(a){var c=a.className.replace("day ","").replace(" selectedDay").toInt();b.setTime(c),b.getDayOfYear()===this.selectedDate.getDayOfYear()?a.addClass("selectedDay"):a.removeClass("selectedDay")}.bind(this))}.bind(this)}}).appendText(this.options.days[b-1]));for(d.appendChild(c),this.options.open=this.options.open<0?0:this.options.open,this.options.close>24||this.options.close<this.options.open?this.options.close=24:this.options.close,a=this.options.open;a<this.options.close+1;a++){for(c=new Element("tr"),b=0;b<e;b++)if(0===b){var f=1===a.length?a+"0:00":a+":00";c.adopt(new Element("td",{class:"day"}).set("text",f))}else c.adopt(new Element("td",{class:"day",styles:{width:this.options.weekday.width+"px",height:this.options.weekday.height+"px","background-color":"#F7F7F7","vertical-align":"top",padding:0,border:"1px solid #cccccc"},events:{mouseenter:function(a){this.hasClass("selectedDay")||this.setStyles({"background-color":"#FFFFDF"})},mouseleave:function(a){this.hasClass("selectedDay")||this.setStyles({"background-color":"#F7F7F7"})},dblclick:function(a){this.openAddEvent(a,"week")}.bind(this)}}));d.appendChild(c)}this.weekView=new Element("div",{class:"weekView",styles:{position:"relative"}}).adopt(new Element("table",{styles:{"border-collapse":"collapse"}}).adopt(d)),this.el.getElement(".viewContainer").appendChild(this.weekView)}this.showWeek(),this.showView("weekView")},repositionEvents:function(){document.getElements("a.week-event, a.day-event").each(function(a){var b=a.retrieve("relativeTo");a.position({relativeTo:b,position:"upperLeft"});var c=a.retrieve("gridSize"),d=Math.floor((b.getSize().x-c)/c);d-=a.getStyle("padding-left").toInt()+a.getStyle("padding-right").toInt(),a.setStyle("width",d+"px")})},render:function(a){this.setOptions(a),window.addEvent("resize",function(){this.repositionEvents()}.bind(this)),this.y=this.el.getPosition().y;var b=function(){var a=this.el.getPosition().y;a!==this.y&&(this.y=a,this.repositionEvents())}.bind(this);window.setInterval(b,200),document.addEvent("click:relay(button[data-task=deleteCalEvent], a[data-task=deleteCalEvent])",function(a,b){a.preventDefault(),this.deleteEntry()}.bind(this)),document.addEvent("click:relay(button[data-task=editCalEvent], a[data-task=editCalEvent])",function(a,b){a.preventDefault(),this.editEntry()}.bind(this)),document.addEvent("click:relay(button[data-task=viewCalEvent], a[data-task=viewCalEvent])",function(a,b){a.preventDefault(),this.activeHoverEvent||(this.activeHoverEvent=b.hasClass("fabrikEvent")?b:b.getParent(".fabrikEvent")),this.viewEntry()}.bind(this)),document.addEvent("click:relay(a.fabrikEvent)",function(a,b){this.activeHoverEvent=a.target.hasClass("fabrikEvent")?a.target:a.target.getParent(".fabrikEvent")}.bind(this)),this.windowopts.title=Joomla.JText._("PLG_VISUALIZATION_CALENDAR_ADD_EDIT_EVENT"),this.windowopts.y=this.options.popwiny,this.popWin=this._makePopUpWin();var c=this.options.urlfilters;c.visualizationid=this.options.calendarId,this.firstRun&&(this.firstRun=!1,c.resetfilters=this.options.restFilterStart),this.ajax.updateEvents=new Request({url:this.options.url.add,data:c,evalScripts:!0,onSuccess:function(a){if("null"!==typeOf(a)){var b=a.stripScripts(!0),c=JSON.decode(b);this.addEntries(c),this.showView()}}.bind(this)}),this.ajax.deleteEvent=new Request({url:this.options.url.del,data:{visualizationid:this.options.calendarId},onComplete:function(a){a=a.stripScripts(!0);var b=JSON.decode(a);this.entries=$H(),this.addEntries(b)}.bind(this)}),"null"!==typeOf(this.el.getElement(".addEventButton"))&&this.el.getElement(".addEventButton").addEvent("click",function(a){this.openAddEvent(a)}.bind(this));var d=[],e=new Element("div",{class:"calendarNav"}).adopt(new Element("ul",{class:"viewMode"}).adopt(d));switch(this.el.appendChild(e),this.el.appendChild(new Element("div",{class:"viewContainer"})),"null"!==typeOf(Cookie.read("fabrik.viz.calendar.date"))&&(this.date=new Date(Cookie.read("fabrik.viz.calendar.date"))),"null"===typeOf(Cookie.read("fabrik.viz.calendar.view"))?this.options.viewType:Cookie.read("fabrik.viz.calendar.view")){case"dayView":this.renderDayView();break;case"weekView":this.renderWeekView();break;default:case"monthView":this.renderMonthView()}this.el.getElement(".nextPage").addEvent("click",function(a){this.nextPage(a)}.bind(this)),this.el.getElement(".previousPage").addEvent("click",function(a){this.previousPage(a)}.bind(this)),this.options.show_day&&this.el.getElement(".dayViewLink").addEvent("click",function(a){this.renderDayView(a)}.bind(this)),this.options.show_week&&this.el.getElement(".weekViewLink").addEvent("click",function(a){this.renderWeekView(a)}.bind(this)),(this.options.show_week||this.options.show_day)&&this.el.getElement(".monthViewLink").addEvent("click",function(a){this.renderMonthView(a)}.bind(this)),this.el.getElement(".centerOnToday").addEvent("click",function(a){this.centerOnToday(a)}.bind(this)),this.showMonth(),this.ajax.updateEvents.send()},showMessage:function(a){this.el.getElement(".calendar-message").set("html",a),this.fx.showMsg.start({opacity:[0,1]}).chain(function(){this.start.delay(2e3,this,{opacity:[1,0]})})},addEntry:function(a,b){var c,d,e,f;if(b.startdate){if(c=b.startdate.split(" "),c=c[0],""===c.trim())return;if(f=b.startdate.split(" "),f=f[1],f=f.split(":"),c=c.split("-"),d=new Date,e=c[1].toInt()-1,d.setYear(c[0]),d.setMonth(e,c[2]),d.setDate(c[2]),d.setHours(f[0].toInt()),d.setMinutes(f[1].toInt()),d.setSeconds(f[2].toInt()),b.startdate=d,this.entries.set(a,b),b.enddate){if(c=b.enddate.split(" "),c=c[0],""===c.trim())return;if("0000-00-00"===c)return void(b.enddate=b.startdate);f=b.enddate.split(" "),f=f[1],f=f.split(":"),c=c.split("-"),d=new Date,e=c[1].toInt()-1,d.setYear(c[0]),d.setMonth(e,c[2]),d.setDate(c[2]),d.setHours(f[0].toInt()),d.setMinutes(f[1].toInt()),d.setSeconds(f[2].toInt()),b.enddate=d}}},deleteEntry:function(){var a=this.activeHoverEvent.id.replace("fabrikEvent_",""),b=a.split("_"),c=b[0];this.options.deleteables.contains(c)&&confirm(Joomla.JText._("PLG_VISUALIZATION_CALENDAR_CONF_DELETE"))&&(this.ajax.deleteEvent.options.data={id:b[1],listid:c},this.ajax.deleteEvent.send(),document.id(this.activeHoverEvent).fade("out"),this.fx.showEventActions.start({opacity:[1,0]}),this.removeEntry(a),this.activeDay=null)},editEntry:function(a){var b={};b.id=this.options.formid;var c=this.activeHoverEvent.id.replace("fabrikEvent_","").split("_");b.rowid=c[1],b.listid=c[0],a&&a.stop(),this.addEvForm(b)},viewEntry:function(){var a={};a.id=this.options.formid;var b=this.activeHoverEvent.id.replace("fabrikEvent_","").split("_");a.rowid=b[1],a.listid=b[0],a.nextView="details",this.addEvForm(a)},addEntries:function(a){a=$H(a),a.each(function(a,b){this.addEntry(b,a)}.bind(this)),this.showView()},removeEntry:function(a){this.entries.erase(a),this.showView()},nextPage:function(){switch(this.fadePopWin(0),this.options.viewType){case"dayView":this.date.setTime(this.date.getTime()+this.DAY),this.showDay();break;case"weekView":this.date.setTime(this.date.getTime()+this.WEEK),this.showWeek();break;case"monthView":this.date.setDate(1),this.date.setMonth(this.date.getMonth()+1),this.showMonth()}Cookie.write("fabrik.viz.calendar.date",this.date)},fadePopWin:function(a){this.popWin&&this.popWin.setStyle("opacity",a)},previousPage:function(){switch(this.fadePopWin(0),this.options.viewType){case"dayView":this.date.setTime(this.date.getTime()-this.DAY),this.showDay();break;case"weekView":this.date.setTime(this.date.getTime()-this.WEEK),this.showWeek();break;case"monthView":this.date.setMonth(this.date.getMonth()-1),
this.showMonth()}Cookie.write("fabrik.viz.calendar.date",this.date)},addLegend:function(a){var b=new Element("ul");a.each(function(a){var c=new Element("li");c.adopt(new Element("div",{styles:{"background-color":a.colour}}),new Element("span").appendText(a.label)),b.appendChild(c)}.bind(this)),new Element("div",{class:"calendar-legend"}).adopt([new Element("h3").appendText(Joomla.JText._("PLG_VISUALIZATION_CALENDAR_KEY")),b]).inject(this.el,"after")},_getGreyscaleFromRgb:function(a){var b=parseInt(a.substring(1,3),16),c=parseInt(a.substring(3,5),16),d=parseInt(a.substring(5),16),e=parseInt(.3*b+.59*c+.11*d,10);return"#"+e.toString(16)+e.toString(16)+e.toString(16)},_getColor:function(a,b){if(!this.options.greyscaledweekend)return a;new Color(a);return"null"===typeOf(b)||0!==b.getDay()&&6!==b.getDay()?a:this._getGreyscaleFromRgb(a)}});Date._MD=new Array(31,28,31,30,31,30,31,31,30,31,30,31),Date.SECOND=1e3,Date.MINUTE=60*Date.SECOND,Date.HOUR=60*Date.MINUTE,Date.DAY=24*Date.HOUR,Date.WEEK=7*Date.DAY,Date.prototype.getMonthDays=function(a){var b=this.getFullYear();return void 0===a&&(a=this.getMonth()),0!=b%4||0==b%100&&0!=b%400||1!==a?Date._MD[a]:29},Date.prototype.isSameWeek=function(a){return this.getFullYear()===a.getFullYear()&&this.getMonth()===a.getMonth()&&this.getWeekNumber()===a.getWeekNumber()},Date.prototype.isSameDay=function(a){return this.getFullYear()===a.getFullYear()&&this.getMonth()===a.getMonth()&&this.getDate()===a.getDate()},Date.prototype.isSameHour=function(a){return this.getFullYear()===a.getFullYear()&&this.getMonth()===a.getMonth()&&this.getDate()===a.getDate()&&this.getHours()===a.getHours()},Date.prototype.isDateBetween=function(a,b){var c=1e4*a.getFullYear()+100*(a.getMonth()+1)+a.getDate(),d=1e4*b.getFullYear()+100*(b.getMonth()+1)+b.getDate(),e=1e4*this.getFullYear()+100*(this.getMonth()+1)+this.getDate();return c<=e&&e<=d};