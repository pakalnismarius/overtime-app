# README

This README would normally document whatever steps are necessary to get the
# Overtime App

## Models
- x Post -> date:date rationale:text
- x User -> Devise
- x AdminUser - STI

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- Administrate admin dashboard
- Block non admin guest users
- Email summary to managers dor approval
- Needs to be documented if employee did not log overtime

## UI
- x Bootstrap -> formating
- x Update the styles for forms

Overtime App

Models:
x Post -> date:date work_performed:text
x User -> Devise
x AdminUser -> Single table ingeritance
x AuditLog

Features:
x Approval Workflow
x SMS Sending -> link to approval or overtime input
x Administrate admin dashboard
x Block non admin and guest users
x Email summary to managers for approval
x Needs to be documented if employee did not log overtime
x Create audit log for each text message
x Need to update end_date when confirmed
x Need to update audit log status when overtime rejected
x Home icon
x Update buttons on employee homepage so they show on mobile
x Update buttons to include time span
x Update button sort order on employee homepage
x Remove unnecessary nav bar buttons for managers
x Fix admin dashboard bug
x Imlement new relic for keeping site alive
x Integrate validation for phone attr in User:
x No spaces or dashes
x all characters have to be number
x Exaclty 8 characters
x Add full_name method to users
x Refactor user association integration test in post_spec

UI:
x Bootstrap -> formatting
x Icons from glyphicons
x Update the styles for forms
