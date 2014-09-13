---
---

countdown = d3.select("div#container").append("div")
  .attr "id", "countdown"

numbers = countdown.append("div")

labels = countdown.append("div")

date = new Date("2015/05/23 5:00").getTime()

names = ["day", "hour", "minute", "second"]

countdown = ->

  current = new Date().getTime()
  seconds = (date - current) / 1000
  days    = parseInt seconds / 86400
  seconds = seconds % 86400
  hours   = parseInt seconds / 3600
  seconds = seconds % 3600
  minutes = parseInt seconds / 60
  seconds = parseInt seconds % 60

  data = [days, hours, minutes, seconds]
  trim = () ->
    if data[0] is 0
      data.shift()
      trim()
  trim()

  number = numbers.selectAll("div.number").data data
  number.enter().append "div"
    .attr "class", "number"
  number.text (d) -> d
  number.exit().remove()

  label = labels.selectAll("div.label").data data
  label.enter().append "div"
    .attr "class", "label"
  label.text (d,i) ->
    offset = 4 - data.length
    mod = if d is 1 then "" else "s"
    names[i+offset]+mod
  label.exit().remove()

countdown()
setInterval countdown, 1000
