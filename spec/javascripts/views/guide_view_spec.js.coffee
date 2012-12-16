#= require spec

describe "GuideView", ->
  beforeEach ->
    @paper = new Raphael(0, 0, 1000, 1000)
    @guide = new Gaslight.Models.Guide
      start:
        right: 100
        bottom: 100
      points: [
        {right: 200, left: 200}
      ]
    @guideView = new Gaslight.Views.GuideView
      paper: @paper
      model: @guide

  describe "constructor", ->
    it "has a paper", ->
      @guideView.paper.should.exist

  describe "line", ->
    beforeEach ->
      @guideView.createLine()
    it "should color the line", ->
      @guideView.line.attr('stroke').should.equal @guide.get('color')


  describe "dot", ->
    beforeEach ->
      @guideView.createLine()
      @guideView.createDot()
    it "should create a dot", ->
      @guideView.dot.should.be.defined
    xit "should follow the line", ->
      @guideView.dot.attr('follow').should.equal @guideView.line