# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

cacfp = Program.create({title: "Child and Adult Care Food Program", description:"The Child and Adult Care Food Program (CACFP), started in 1968, provides federal funds for meals and snacks to child care centers, family child care homes, before and after school programs, and adult day care centers.
The program, administered by the USDA, plays a vital role in improving the quality of child care and making it more affordable for many low-income families.  Each day, 2.6 million children receive nutritious meals and snacks through CACFP.  The program also provides meals and snacks to 74,000 adults who receive care in nonresidential adult day care centers.  CACFP reaches even further to provide meals to children residing in homeless shelters, and snacks and suppers to youths participating in eligible afterschool care programs.
Independent centers and sponsoring organizations enter into agreements with their administering State agencies to assume administrative and financial responsibility for CACFP operations."})
cc = Program.create({title:"Child Care" , description:"SKCDC operates Early Care and Education programs in Southern Kennebec County. Each program provides comprehensive early education, health, nutrition, and family services to enrolled children and their families.  We believe children learn through play.  We encourage children to explore the world at their own pace, with the loving support and guidance of parents and teachers. Our programs offer a child-centered curriculum which reflects the lives and interests of children and families.  Teachers work together with families to provide activities and materials that reflect family backgrounds and cultures and are designed to foster the healthy development of self esteem, social, physical, and intellectual skills, as well as skills of effective communication. We recognize and respect the individuality of each child and family, and we strive to provide a learning environment within which each child and family can feel successful.
All programs are developmentally, culturally, and linguistically appropriate and include all areas of growth: physical, language, social, emotional, and cognitive.
Our Early Care and Education Programs are designed to provide quality education and care for each enrolled child aged 6 weeks to 5 years.
SKCDC Child Care Centers are licensed and hold Step 4 Certificates of Quality by the State of Maine, Department of Health and Human Services.
"})
cco = Program.create({title: "Child Care Options", description:"Training that keeps up with you! Don't stress about fitting training into your schedule.  Instead, complete your annual training hours with us!  Child Care Options offers an array of early childhood and school-age trainings face to face, online and even by mail.
Child care providers have one of the most important jobs - the care and education of children during the most crucial early learning and school-age years.  Child Care Options strives to provide trainings that cover critical issues and provide relevant information.  Through training activities, providers gain practical application and knowledge of the material, which we hope will inspire improvement in overall practice.
Courses vary in level of difficulty and number of training hours, and are priced accordingly."})
ehs = Program.create({title:"Early Head Start", description: "SKCDC operates Early Head Start programs for infants, toddlers, and their families.  Early Head Start encompasses a comprehensive range of services, similar to Head Start, including child and family development, health and nutrition, and community partnerships.  Services are provided in centers and in home-based, family visiting programs.
Current research regarding brain development during the first three years supports the principles that form the foundation for Early Head Start.   SKCDC’s Early Head Start programs support each child’s physical, social, emotional, cognitive, and language development through early education experiences in a variety of settings.  Recognizing that parents are children’s first and most important teachers, staff and families create individualized plans that promote the strength-based development of child and family goals.  All Early Head Start staff receive ongoing training and professional development opportunities that increase skills in developing caring, supportive relationships with children and families.
Early Head Start programs strive to provide all enrolled children and families with continuity of care that supports the development of strong, stable relationships between caregivers and children.
Families are responsible for transporting children to and from programs. We assist families in accessing community based transportation services and financial supports.  Transportation stipends are also available for eligible families."})
hs = Program.create({title:"Head Start", description:"SKCDC has operated the Head Start Program since its inception in 1965. Studies at that time showed that children from low income families were not entering school as prepared to learn as children from higher economic levels. Head Start was designed to offer high quality early childhood education, nutrition, health, and social services, along with a strong parent involvement component. Initially, the primary goal of the program was to increase social competence in preschool children. That goal has expanded to include more emphasis on a child's cognitive development especially in the areas of language and literacy.
Every Head Start program nationwide is guided by the federally mandated Performance Standards."})
#
gardiner = Classroom.create({name:"Gardiner Center", street_address:"12 Plummer Street", town:"Gardiner", zipcode:"04345"})
lr = Classroom.create({name:"Lake Region Center", street_address: "165 Lakeview Drive", town: "China", zipcode:"04358"})
my = Classroom.create({name:"Magic Years Center", street_address:"25 Industrial Drive", town:"Augusta", zipcode: "04330"})

my.programs << cc
my.programs << hs
my.programs << ehs
lr.programs << hs
gardiner.programs << hs

Contact.create(first_name: "Cristina", last_name: "Salois", title: "Agency Director", email:"cristina.salois@skcdc.org", ext: "22")
Contact.create(first_name: "Monique", last_name: "Morin", title: "Finance Director", email: "monique@skcdc.org", ext: "15")
Contact.create(first_name: "Lucinda", last_name:"Long", title: "Human Resources Director", email:"hr@skcdc.org", ext:"21")
Contact.create(first_name: "Clay", last_name: "Hoffman", title: "Information Systems Manager", email: "clayh@skcdc.org", ext: "11")
