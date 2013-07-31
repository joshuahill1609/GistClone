GistClone.Views.GistFormView = Backbone.View.extend({
  template: JST["gists/new"],

  tagName: "form",

  className: "new-gist",

  events: {
    "submit" : "buildGist"
  },

  render: function(){
    var that = this;

    var renderedContent = that.template();

    that.$el.html(renderedContent);
    return that;
  },

  buildGist: function(event){
    var that = this;

    event.preventDefault();

    this.collection.create({
      title: $('.new-gist').find("input#title").val()
    });

    this.options.installSidebar(this.collection, this.$sidebar);

    return that;
  }

});