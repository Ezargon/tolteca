/*! Fabrik */

var History=new Class({initialize:function(a,b){this.recording=!0,this.pointer=-1,document.id(a)&&document.id(a).addEvent("click",function(a){this.undo(a)}.bind(this)),document.id(b)&&document.id(b).addEvent("click",function(a){this.redo(a)}.bind(this)),Fabrik.addEvent("fabrik.history.on",function(a){this.on(a)}.bind(this)),Fabrik.addEvent("fabrik.history.off",function(a){this.off(a)}.bind(this)),Fabrik.addEvent("fabrik.history.add",function(a){this.add(a)}.bind(this)),this.history=[]},undo:function(){if(this.pointer>-1){this.off();var a=this.history[this.pointer],b=a.undofunc,c=a.undoparams;b.attempt(c,a.object);this.on(),this.pointer--}},redo:function(){if(this.pointer<this.history.length-1){this.pointer++,this.off();var a=this.history[this.pointer],b=a.redofunc,c=a.redoparams;b.attempt(c,a.object);this.on()}},add:function(a,b,c,d,e){if(this.recording){var f=this.history.filter(function(a,b){return b<=this.pointer}.bind(this));this.history=f,this.history.push({object:a,undofunc:b,undoparams:c,redofunc:d,redoparams:e}),this.pointer++}},on:function(){this.recording=!0},off:function(){this.recording=!1}});