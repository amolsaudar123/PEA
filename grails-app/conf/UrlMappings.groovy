class UrlMappings {

    static mappings = {
        "/$controller/$action?/$id?(.$format)?" {
            constraints {
                // apply constraints here
            }
        }

        "/"(view: "/index")
        "500"(view: '/error')
        "/api/loginsuccess"(controller: "login", action: "loginSuccess")
        "/api/profile"(controller: "login", action: "profile")
        "/api/onLogin"(controller: "dashboard", action: "onLogin")

        "/api/index"(controller: "account", action: "index")
        "/api/expenses"(controller: "API", action: "getAggregatedExpenses")

        "/api/index1"(controller: "expense", action: "index1")
    }
}
