GistClone.Routers.GistsRouter = Backbone.Router.extend({
  initialize: function($sidebar, $content, gistsData) {
    this.$sidebar = $sidebar;
    this.$content = $content;
    this.gists = new GistClone.Collections.Gists(gistsData);
  },

  routes: {
    "" : "index",
    "new" : "create",
    ":id" : "show"
  },

  index: function() {
    this.installSidebar();
  },

  show: function(id) {
    var that = this;

    var gist = that.gists.findWhere({id: parseInt(id)});

    var gistShowView = new GistClone.Views.GistShowView({
      model: gist
    })

    this.installSidebar();
    this.$content.html(gistShowView.render().$el);
  },

  create: function(){
    var that = this;

    var gistFormView = new GistClone.Views.GistFormView({
      collection: this.gists,
      installSidebar:  this.installSidebar,
      $sidebar: this.$sidebar
    });

    this.installSidebar();
    this.$content.html(gistFormView.render().$el);
  },

  installSidebar: function(gists, $sidebar) {
    if(!gists)
      gists = this.gists;
    if(!$sidebar)
      $sidebar = this.$sidebar

    var that = this;

    var gistsIndexView = new GistClone.Views.GistsIndexView({
      collection: gists
    });

    this.$sidebar.html(gistsIndexView.render().$el);
  }
});