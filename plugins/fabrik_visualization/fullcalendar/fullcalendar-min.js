/*! Fabrik */

define(["jquery","fab/fabrik","fullcalendar"],function(a,b,c){return new Class({Implements:[Options],options:{canAdd:!1,show_week:!1,show_day:!1,default_view:"dayView",time_format:"",first_week_day:1,minDuration:0,greyscaledweekend:!1,calOptions:{},startOffset:0,url:{del:"index.php?option=com_fabrik&controller=visualization.fullcalendar&view=visualization&task=deleteEvent&format=raw"}},initialize:function(c,d){function e(a,b,c){"touchend"===b.type?h.openAddEvent(b,c.name,a):(l=a,m=c.name,h.calendar.on("mousemove",f))}function f(){l=m=null,h.calendar.off("mousemove",f)}function g(){var b=a(this);b.css("display","block"),b.css("margin-top",Math.max(0,(a(window).height()-b.height())/2));var c=b.width(),d="-"+c/2+"px!important";b.css("margin-left",d)}var h=this,i="",j=[];this.el=a("#"+c),this.calendar=this.el.find('*[data-role="calendar"]'),this.setOptions(d),this.date=new Date,this.clickdate=null,this.ajax={},this.windowopts={id:"addeventwin",title:"",loadMethod:"xhr",minimizable:!1,evalScripts:!0},this.el.find(".addEventButton").on("click",function(a){a.preventDefault(),h.openAddEvent(a)}),b.addEvent("fabrik.form.submitted",function(a,c){h.calendar.fullCalendar("refetchEvents"),b.Windows.addeventwin.close()}),this.options.eventLists.each(function(a,b){j.push({events:function(c,d,e,f){var g=this.options.url.add;g.test(/\?/)?g+="&":g+="?",g+="listid="+a.value,g+="&eventListKey="+b,g+="&startDate="+c.format(),g+="&endDate="+d.format(),new Request({url:g,evalScripts:!0,onSuccess:function(a,b){"null"!==typeOf(b)&&this.processEvents(b,f)}.bind(this,f)}).send()}.bind(this),color:a.colour})}.bind(this)),!1!==this.options.show_week&&(i+="agendaWeek"),!1!==this.options.show_day&&(i.length>0&&(i+=","),i+="agendaDay"),i.length>0&&(i="month,"+i);var k="month";switch(this.options.default_view){case"monthView":break;case"weekView":!1!==this.options.show_week&&(k="agendaWeek");break;case"dayView":!1!==this.options.show_day&&(k="agendaDay")}var l=null,m=null;this.calendar.dblclick(function(a){l&&h.openAddEvent(a,m,l)}),this.calOptions={header:{left:"prev,next today",center:"title",right:i},fixedWeekCount:!1,timeFormat:this.options.time_format,defaultView:k,nextDayThreshold:"00:00:00",firstDay:this.options.first_week_day,eventSources:j,defaultTimedEventDuration:this.options.minDuration,minTime:this.options.open,maxTime:this.options.close,weekends:this.options.showweekends,eventClick:function(a,b,c){return b.stopPropagation(),b.preventDefault(),h.clickEntry(a),!1},dayClick:e,viewRender:function(b,c){!0===h.options.greyscaledweekend&&(a("td.fc-sat").css("background","#f2f2f2"),a("td.fc-sun").css("background","#f2f2f2"))},eventRender:function(a,b){b.find(".fc-title").html(a.title)},loading:function(a){}},a.extend(!0,this.calOptions,JSON.parse(h.options.calOptions)),this.calendar.fullCalendar(this.calOptions),document.addEvent("click:relay(button[data-task=viewCalEvent], a[data-task=viewCalEvent])",function(b){b.preventDefault();var c=a(b.target).closest(".calEventButtonsID")[0].id;c=c.replace(/_buttons/,"");var d=h.calendar.fullCalendar("clientEvents",c)[0];a("#fabrikEvent_modal").modal("hide"),h.viewEntry(d)}),document.addEvent("click:relay(button[data-task=editCalEvent], a[data-task=editCalEvent])",function(b){b.preventDefault();var c=a(b.target).closest(".calEventButtonsID")[0].id;c=c.replace(/_buttons/,"");var d=h.calendar.fullCalendar("clientEvents",c)[0];a("#fabrikEvent_modal").modal("hide"),h.editEntry(d)}),document.addEvent("click:relay(button[data-task=deleteCalEvent], a[data-task=deleteCalEvent])",function(b){b.preventDefault();var c=a(b.target).closest(".calEventButtonsID")[0].id;c=c.replace(/_buttons/,"");var d=h.calendar.fullCalendar("clientEvents",c)[0];a("#fabrikEvent_modal").modal("hide"),h.deleteEntry(d)});var n=this.options.url.del;n.test(/\?/)?n+="&":n+="?",n+="task=deleteEvent",this.ajax.deleteEvent=new Request({url:n,data:{visualizationid:this.options.calendarId},onComplete:function(){h.calendar.fullCalendar("refetchEvents")}}),a(".modal").on("show.bs.modal",g),a(window).on("resize",function(){a(".modal:visible").each(g)})},processEvents:function(c,d){c=$H(JSON.decode(c));var e,f,g,h,i,j,k,l,m,n,o,p,q,r=[];c.each(function(c){m=a(b.jLayouts["fabrik-visualization-fullcalendar-event-popup"])[0],n=c._listid+"_"+c.id,m.id="fabrikevent_"+n,o=a(b.jLayouts["fabrik-visualization-fullcalendar-viewevent"])[0],p=moment(c.startdate),q=moment(c.enddate),k=l="",(moment(q.format("YYYY-MM-DD"))>moment(p.format("YYYY-MM-DD"))||!1===c.startShowTime&&!1===c.endShowTime)&&(k=p.format("MMM DD")+" ",l=q.format("MMM DD")+" "),e=f="",!0===c.startShowTime&&!0===c.endShowTime&&(e=p.format("hh.mm A"),f=q.format("hh.mm A")),o.getElement("#viewstart").innerHTML=k+e,o.getElement("#viewend").innerHTML=l+f;var d=a(o).find("[data-role=fabrik-popup-template]");d&&(""!==c.popupTemplate?a(d).prepend(c.popupTemplate):a(d).hide()),a(m).attr("data-content",a(o).prop("outerHTML")),g=a(b.jLayouts["fabrik-visualization-fullcalendar-viewbuttons"]),g[0].id="fabrikevent_buttons_"+n,h=g.find(".popupDelete"),!1===c._canDelete?h.remove():h.attr("title",Joomla.JText._("PLG_VISUALIZATION_FULLCALENDAR_DELETE")),i=g.find(".popupEdit"),!1===c._canEdit?i.remove():i.attr("title",Joomla.JText._("PLG_VISUALIZATION_FULLCALENDAR_EDIT")),j=g.find(".popupView"),!1===c._canView?j.remove():j.attr("title",Joomla.JText._("PLG_VISUALIZATION_FULLCALENDAR_VIEW")),a(m).attr("data-buttons",g.prop("outerHTML")),a(m).attr("data-title",c.label),a(m).append(c.label),r.push({id:m.id,title:a(m).prop("outerHTML"),start:c.startdate,end:c.enddate,url:c.link,customURL:c.customLink,className:c.status,allDay:c.allday,listid:c._listid,rowid:c.__pk_val,formid:c._formid})}.bind(r)),d(r)},addEvForm:function(c){var d=this;void 0!==a&&a(this.popOver).popover("hide"),this.windowopts.id="addeventwin";var e=this.options.url.addev;if(e.test(/\?/)?e+="&":e+="?",e+="listid="+c.listid,e+="&rowid="+c.rowid,e+="&fabrik_window_id="+this.windowopts.id,e+="&task=addEvForm",c.nextView&&(e+="&nextview="+c.nextView),null!==this.clickdate){this.clickdate=moment(this.clickdate).add({h:this.options.startOffset}).format("YYYY-MM-DD HH:mm:ss");var f=d.calendar.fullCalendar("option","defaultTimedEventDuration").split(":"),g=moment(this.clickdate).add({h:f[0],m:f[1],s:f[2]}).format("YYYY-MM-DD HH:mm:ss");e+="&start_date="+this.clickdate+"&end_date="+g}this.windowopts.type="window",this.windowopts.contentURL=e,this.windowopts.title=c.title,this.windowopts.modalId="fullcalendar_addeventwin";var h=this.options.filters;this.windowopts.onContentLoaded=function(){h.each(function(a){if(document.id(a.key))switch(document.id(a.key).get("tag")){case"select":document.id(a.key).selectedIndex=a.val;break;case"input":document.id(a.key).value=a.val}}),this.fitToContent(!1)},b.getWindow(this.windowopts)},viewEntry:function(a){this.clickdate=null;var b={};b.id=a.formid,b.rowid=a.rowid,b.listid=a.listid,b.nextView="details",b.title=Joomla.JText._("PLG_VISUALIZATION_FULLCALENDAR_VIEW_EVENT"),this.addEvForm(b)},editEntry:function(a){this.clickdate=null;var b={};b.id=a.formid,b.rowid=a.rowid,b.listid=a.listid,b.nextView="form",b.title=Joomla.JText._("PLG_VISUALIZATION_FULLCALENDAR_EDIT_EVENT"),this.addEvForm(b)},deleteEntry:function(a){window.confirm(Joomla.JText._("PLG_VISUALIZATION_FULLCALENDAR_CONF_DELETE"))&&(this.ajax.deleteEvent.options.data={id:a.rowid,listid:a.listid},this.ajax.deleteEvent.send())},clickEntry:function(b){if(""!==b.customURL)window.open(b.customURL,"_blank");else if(!1===this.options.showFullDetails){var c=a("#fabrikEvent_modal.modal");c.find(".modal-title").html(a("#"+b.id).attr("data-title")),c.find(".modal-body").html(a("#"+b.id).attr("data-content")),c.find(".modal-footer .calEventButtons").html(a("#"+b.id).attr("data-buttons")),c.modal("show")}else this.viewEntry(b)},openAddEvent:function(a,b,c){var d,e,f,g,h,i,j;if(!1!==this.options.canAdd&&("month"!==b||!0!==this.options.readonlyMonth)){switch(a.type){case"dblclick":case"touchend":j=c;break;case"click":j=moment();break;default:return void window.alert("Unknown event in OpenAddEvent: "+a.type)}"month"===b?e=f="00":(e=(e=j.hour())<10?"0"+e:e,f=(f=j.minute())<10?"0"+f:f),d=(d=j.date())<10?"0"+d:d,g=(g=j.month()+1)<10?"0"+g:g,h=j.year(),this.clickdate=h+"-"+g+"-"+d+" "+e+":"+f+":00",("dblclick"!==a.type||this.dateInLimits(this.clickdate))&&(this.options.eventLists.length>1?this.openChooseEventTypeForm(this.clickdate,void 0):(i={},i.rowid="",i.id="",i.listid=this.options.eventLists[0].value,i.title=Joomla.JText._("PLG_VISUALIZATION_FULLCALENDAR_ADD_EVENT"),this.addEvForm(i)))}},dateInLimits:function(a){var c=new moment(a);if(b.fireEvent("fabrik.viz.fullcalendar.dateinlimits",[this,a]).eventResults.contains(!1))return!1;if(""!==this.options.dateLimits.min){var d=new moment(this.options.dateLimits.min);if(c.isBefore(d))return window.alert(Joomla.JText._("PLG_VISUALIZATION_FULLCALENDAR_DATE_ADD_TOO_EARLY")),!1}if(""!==this.options.dateLimits.max){var e=new moment(this.options.dateLimits.max);if(c.isAfter(e))return window.alert(Joomla.JText._("PLG_VISUALIZATION_FULLCALENDAR_DATE_ADD_TOO_LATE")),!1}return!0},openChooseEventTypeForm:function(a,c){var d=this.options.url.choose;d.test(/\?/)?d+="&":d+="?",d+="d="+a,d+="&rawd="+c,d+="&renderContext="+this.el.prop("id").replace(/visualization_/,""),d+="&task=chooseAddEvent",this.windowopts.contentURL=d,this.windowopts.id="chooseeventwin",this.windowopts.modalId="fullcalendar_!chooseeventwin",b.getWindow(this.windowopts)}})});