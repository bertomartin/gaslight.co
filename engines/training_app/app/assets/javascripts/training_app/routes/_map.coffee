Training.Router.map ->
  @resource "sections", { path: '/' }, ->
    @resource "chapter", { path: 'chapters/:chapter_id' }