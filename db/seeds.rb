department__fn = Department.find_or_create_by!(short_name: 'FN', full_name: 'Full Name')

course__aa0000 = Course.find_or_create_by!(name: 'zzzzzz', code: 'aa0000', description: 'description')
course__aa9999 = Course.find_or_create_by!(name: 'rrrrrr', code: 'aa9999', description: 'description')

CourseAssociation.find_or_create_by!(successor: course__aa9999, precursor: course__aa0000)

Requirement.find_or_create_by!(required_department: department__fn, require_course: course__aa0000)

Session.find_or_create_by!(course: course__aa0000, start_time: '01/10/2016 14:00:00'.in_time_zone, end_time: '01/10/2016 15:00:00'.in_time_zone)
Session.find_or_create_by!(course: course__aa0000, start_time: '01/10/2016 16:00:00'.in_time_zone, end_time: '01/10/2016 17:00:00'.in_time_zone)
Session.find_or_create_by!(course: course__aa9999, start_time: '01/10/2016 18:00:00'.in_time_zone, end_time: '01/10/2016 19:00:00'.in_time_zone)

Member.find_or_create_by!(name: '6y', student_id: '54285290', phone: '63884811', department: department__fn)
