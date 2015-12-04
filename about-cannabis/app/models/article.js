import DS from 'ember-data';

export default DS.Model.extend({
  title: DS.attr('string'),
  body: DS.attr('string'),
  slug: DS.attr('string'),
  source: DS.attr('string'),
  media: DS.attr('string'),
  author: DS.attr('string'),
  email: DS.attr('string'),
  isDraft: DS.attr('boolean'),
  isPublic: DS.attr('boolean')
});
