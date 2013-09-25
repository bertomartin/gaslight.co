Training.Router.map ->
  @resource "course", { path: '/courses/:course_id' }, ->
    @resource "chapter", { path: '/chapters/:chapter_id' }