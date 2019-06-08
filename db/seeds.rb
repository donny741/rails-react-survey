# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

survey = Survey.create(name: "Klientų aptarnavimo kokybė", active: false)

survey.survey_questions.create([
    {
        question: "Kaip įvertintumėte pristatymo trukmę?",
        comment_needed: false,
        position: 0
    },
    {
        question: "Įvertinkite puslapio dizainą: ar jum buvo patogu naršyti parduotuvėje?",
        comment_needed: false,
        position: 1
    },
    {
        question: "Kaip įvertintumėte aptarnavimo kokybę: ar buvo suteikta reikiama pagalba renkantis prekę?",
        comment_needed: false,
        position: 2
    },
    {
        question: "Kaip įvertintumėte produkto kokybę?",
        comment_needed: false,
        position: 3
    },
    {
        question: "Kiti Jūsų pageidavimai, pasiūlymai ar nusiskundimai",
        comment_needed: true,
        position: 4
    },
])