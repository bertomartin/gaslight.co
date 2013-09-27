Training.Router.map ->
  @resource "course", { path: '/courses/:course_id' }, ->
    @resource "chapters", ->
      @resource "chapter", path: ":chapter_id"