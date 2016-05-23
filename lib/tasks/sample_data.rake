require 'factory_girl'

namespace :db do
  desc "Reset database and then fill it with sample data"
  task populate: [:environment] do
    FactoryGirl.create(:organization)
    FactoryGirl.create(:term100)
    FactoryGirl.create(:term200)
    FactoryGirl.create(:term300)
    FactoryGirl.create(:term400)
    FactoryGirl.create(:term500)
    FactoryGirl.create(:course)
    FactoryGirl.create(:lms_instance)
    c = FactoryGirl.create(:course_offering_term_1_tr)
    FactoryGirl.create(:course_offering_term_1_mwf)
    FactoryGirl.create(:course_offering_term_2_tr)
    FactoryGirl.create(:course_offering_term_2_mwf)
    FactoryGirl.create(:course_offering_term_3_tr)
    FactoryGirl.create(:course_offering_term_3_mwf)

    FactoryGirl.create(:course_enrollment,
      user: FactoryGirl.create(:admin),
      course_offering: c,
      course_role: CourseRole.instructor)

    FactoryGirl.create(:course_enrollment,
      user: FactoryGirl.create(:instructor_user,
        first_name: 'Ima',
        last_name:  'Teacher',
        email:      "example-1@railstutorial.org"),
      course_offering: c,
      course_role: CourseRole.instructor)

    50.times do |n|
      FactoryGirl.create(:course_enrollment,
        user: FactoryGirl.create(:confirmed_user,
          first_name: Faker::Name.first_name,
          last_name:  Faker::Name.last_name,
          email:      "example-#{n+2}@railstutorial.org"),
        course_offering: c)
    end
  end

  desc "Reset database and then fill it with Summer I 2015 data"
  task populate_su15: [:environment] do
    FactoryGirl.create(:organization)
    FactoryGirl.create(:term,
       season: 200,
       starts_on: "2015-05-25",
       ends_on: "2015-07-07",
       year: 2015)
    FactoryGirl.create(:course)
    c = FactoryGirl.create(:course_offering,
      self_enrollment_allowed: true,
      url: 'http://moodle.cs.vt.edu/course/view.php?id=282',
      label: '60396'
      )
    FactoryGirl.create(:course_enrollment,
      user: FactoryGirl.create(:admin),
      course_offering: c,
      course_role: CourseRole.instructor)
  end

  desc "Drop, create, and migrate"
  task :reset_all => [:drop, :create, :migrate, :seed]

  desc "Rest_all and populate"
  task :reset_populate => [:reset_all, :populate]


end
