# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

rom = ROM.env
rom.command(:tasks).create.call({id: 1, title: 'Task One'})
rom.command(:workers).create.call({id: 1, name: 'Worker One', title: 'Mrs'})
rom.command(:workers).create.call({id: 2, name: 'Worker Two', title: 'Mr'})
rom.command(:tasks_workers).create.call({task_id: 1, worker_id: 1})
rom.command(:tasks_workers).create.call({task_id: 1, worker_id: 2})
