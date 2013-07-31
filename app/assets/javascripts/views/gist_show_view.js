GistClone.Views.GistShowView = Backbone.View.extend({
  template: JST["gists/show"],

  tagName: "p",

  events: {
    "click button.favorited" : "unfavorite",
    "click button.unfavorited" : "favorite"
  },

  render: function() {
    var that = this;

    var renderedContent = this.template({
      gist: that.model
    })

    this.$el.html(renderedContent);

    if(this.model.escape("favorited") === "0")
      this.$el.children('button.favorited').addClass('hidden')
    else
      this.$el.children('button.unfavorited').addClass('hidden')


    return this;
  },

  favorite: function() {
    var that = this;

    $.ajax({
      url: "/gists/" + this.model.escape("id") + "/favorite",
      type: "post",
      success: function() {
        that.model.attributes.favorited = "1";
        that.render();
      }
    })
  },

  unfavorite: function() {
    var that = this;

    $.ajax({
      url: "/gists/" + this.model.escape("id") + "/favorite",
      type: "delete",
      success: function() {
        that.model.attributes.favorited = "0";
        that.render();
      }
    })
  }
});