import config from '../config/environment';
import DS from 'ember-data';
import Ember from 'ember';

var serializer;
if (config.environment === 'test') {
  serializer = DS.JSONSerializer.extend({});
} else {
  serializer = DS.RESTSerializer.extend({
    keyForAttribute(attr) {
      return Ember.String.decamelize(attr);
    }
  });
}

export default serializer;
