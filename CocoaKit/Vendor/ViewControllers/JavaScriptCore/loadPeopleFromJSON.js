var loadPeopleFromJSON = function(jsonString) {
    var data = JSON.parse(jsonString);
    var people = [];
    for (i = 0; i < data.length; i++) {
        var person = Person.createWithFirstNameLastName(data[i].first, data[i].last);
        person.birthYear = data[i].year;

        people.push(person);
    }
    return people;
}