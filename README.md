# Overtime App

## Models:
- Post -> date:date work_performed:text
- User -> Devise
- AdminUser -> Single table ingeritance
- AuditLog

## Features:
- Approval Workflow
- SMS Sending -> link to approval or overtime input
- Administrate admin dashboard
- Block non admin and guest users
- Email summary to managers for approval
- Needs to be documented if employee did not log overtime
- Create audit log for each text message
- Need to update end_date when confirmed
- Need to update audit log status when overtime rejected
- Home icon
- Update buttons on employee homepage so they show on mobile
- Update buttons to include time span
- Update button sort order on employee homepage
- Remove unnecessary nav bar buttons for managers
- Fix admin dashboard bug
- Imlement new relic for keeping site alive
- Integrate validation for phone attr in User:
- No spaces or dashes
- all characters have to be number
- Exaclty 8 characters
- Add full_name method to users
- Refactor user association integration test in post_spec

## UI:
- Bootstrap -> formatting
- Icons from glyphicons
- Update the styles for forms
