GistClone.Views.GistsIndexView = Backbone.View.extend({
  template: JST["gists/index"],

  tagName: "ul",

  render: function() {
    var that = this;

    var renderedContent = this.template({
      gists: that.collection
    });

    this.$el.html(renderedContent);
    return this;
  }
});