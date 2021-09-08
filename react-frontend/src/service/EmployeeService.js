import axios from "axios";

//const EMPLOYEE_API_BASE_URL = "http://localhost:8080/api/v1/employees";

class EmployeeService {

    getEmployees() {
        console.log(process.env.REACT_APP_EMPLOYEE_API_BASE_URL);
        return axios.request({method: "GET",
                              url: process.env.REACT_APP_EMPLOYEE_API_BASE_URL,
                              crossDomain: true})
    }

}

export default new EmployeeService()