local grafana = import 'github.com/grafana/grafonnet/gen/grafonnet-v11.0.0/main.libsonnet';
local dashboard = grafana.dashboard;
local timeSeries = grafana.panel.timeSeries;
local prometheusQuery = grafana.query.prometheus;

dashboard.new('Test')
+ dashboard.withPanels(grafana.util.grid.makeGrid(
  [
    timeSeries.new('example')
    + timeSeries.queryOptions.withTargets(
      prometheusQuery.new('VictoriaMetrics',
                          |||
                            sum(
                                 rate(
                                     request_count
                                 )
                            )
                          |||,)
      + prometheusQuery.withLegendFormat('requests')
    )
    + timeSeries.standardOptions.withUnit('reqps'),
  ],
  panelWidth=12,
  panelHeight=8,
))
