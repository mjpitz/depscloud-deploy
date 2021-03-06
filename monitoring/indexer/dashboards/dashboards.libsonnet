local grafana = import 'github.com/grafana/grafonnet-lib/grafonnet/grafana.libsonnet';
local dashboard = grafana.dashboard;
local row = grafana.row;
local prometheus = grafana.prometheus;
local template = grafana.template;
local graphPanel = grafana.graphPanel;
local singlestat = grafana.singlestat;

{
  grafanaDashboards+:: {
    'depscloud-indexer-grafana.json':
      dashboard.new(
        '%sdeps.cloud / indexer' % $._config.dashboard.prefix,
        time_from='now-1h',
        tags=($._config.dashboard.tags),
        refresh=($._config.dashboard.refresh)
      )
      .addTemplate({
        current: {
          text: 'default',
          value: 'default',
        },
        hide: 0,
        label: null,
        name: 'datasource',
        options: [],
        query: 'prometheus',
        refresh: 1,
        regex: '',
        type: 'datasource',
      })
      .addPanel(
        grafana.text.new(
          title='Notice',
          content='TBD',
          description='TBD',
          span=12,
        ),
        gridPos={
          h: 2,
          w: 24,
          x: 0,
          y: 0,
        },
      ),
  },
}
