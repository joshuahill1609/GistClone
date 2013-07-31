GistClone.Models.Gist = Backbone.Model.extend({

  initialize: function(model) {
    favoriteUrl: "/gists/" + model.id + "/favorite"
  }
});