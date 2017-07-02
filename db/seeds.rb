# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Initial Data for Role
@manager = Role.create(name: "Manager")
@security = Role.create(name: "Security")
@cashier = Role.create(name: "Cashier")
@helper = Role.create(name: "Helper")
# Manager
User.create(name: "manager", email: "manager@ait.asia", password: "manager",
            password_confirmation: "manager", role_id: @manager.id)
# Security
User.create(name: "security", email: "security@ait.asia", password: "security",
            password_confirmation: "security", role_id: @security.id)
# Cashier
User.create(name: "cashier", email: "cashier@ait.asia", password: "cashier",
            password_confirmation: "cashier", role_id: @cashier.id)
# Helper
User.create(name: "helper", email: "helper@ait.asia", password: "helper",
            password_confirmation: "helper", role_id: @helper.id)
