window.cookieconsent.initialise({
    container: document.getElementById("content"),
    palette:{
        popup: {background: "#fff"},
        button: {
            background: "#ff738e",
            text: "#ffffff",
            "border-radius": "5px"
        },
    },
    revokable:false,
    onStatusChange: function(status) {
        console.log(this.hasConsented() ?
            'enable cookies' : 'disable cookies');
    },
    content: { href: "/cookie_policy" },
    cookie: { name: 'pepperminty'},
    law: { regionalLaw: false},
    location: true
});