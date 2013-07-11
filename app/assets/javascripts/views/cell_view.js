
app.Views.CellView = Backbone.View.extend({
  initialize: function() {
    this.$el.droppable({ tolerance: "pointer"});
    this.render();
    this.listenTo(this.model, 'change', this.render);
  },
  events: {
    "drop": function(e, obj) {
      var item = obj.draggable.data('model');
      this.attachDropped(item);
    }
  },
  attachDropped: function(item) {
    this.model.attach(item, item.get('length'), item.get('direction'));
  },
  presenter: function() {
    var defaultPresenter = {};
    var ship = this.model.get('ship');
    if (ship){
      _.extend(defaultPresenter, ship.toJSON());
      defaultPresenter.shortName = defaultPresenter.name[0];
    }
    return  defaultPresenter;
  },
  render: function() {
    this.$el.html(HoganTemplates['cell'].render(this.presenter()));
  }
});