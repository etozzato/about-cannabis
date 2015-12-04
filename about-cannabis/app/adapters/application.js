import DS from 'ember-data';

export default DS.ActiveModelAdapter.extend({
  host: location.protocol + '//' + location.hostname + (location.port ? ':' + location.port: ''),
  namespace: 'api'
});
