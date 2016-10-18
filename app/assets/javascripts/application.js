// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require twitter/bootstrap
//= require material
//= require ripples
//= require Chart.bundle.min
//= require_tree .

$(function() {
  $.material.init();
  if (document.getElementById('temperaturesChart'))
    initChart();
});

var initChart = function() {

  var data = $('#data-chart').data('set');
  var labels = $('#data-chart').data('labels');

  var mac_addresses = data.map(function(d) {
    return d.mac_address;
  });

  var ctx = document.getElementById("temperaturesChart");
  var myChart = new Chart(ctx, {
    type: 'line',
    data: {
      labels: labels,
      datasets: [
      {
        label: "Temperatura",
        backgroundColor: "#80CBC4",
        borderColor: "#4DB6AC",
        data: data
      }
      ]
    },
    options: {
      tooltips: {
        callbacks: {
          label: function(tooltipItems, data) {
            return data.datasets[tooltipItems.datasetIndex].label +': ' + tooltipItems.yLabel + ' °C';
          },
          afterLabel: function(tooltipItems, data) {
            return 'Creado por: ' + (mac_addresses[tooltipItems.datasetIndex] || '-');
          }
        }
      }
    }
  });
}
