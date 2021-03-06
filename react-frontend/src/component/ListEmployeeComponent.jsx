import React, { Component } from 'react';
import EmployeeService from '../service/EmployeeService';

class ListEmployeeComponent extends Component {

    //Constructor
    constructor(props) {
        super(props)

        this.state = {
            employees: []
        }
    }

    //Best place to make REST calls
    componentDidMount(){
        EmployeeService.getEmployees().then((res) => {
            this.setState({ employees: res.data});
        });
    }

    //Rendering the component
    render() {
        return (
            <div>                
                <h2 className="text-center">Employee List</h2>
                <div className="row">
                    <table className="table table-stripped table-bordered">
                        <thead>
                            <tr>
                                <th>Employee First Name</th>
                                <th>Employee Last Name</th>
                                <th>Employee Email Id</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>
                            {
                                this.state.employees.map(
                                    employee =>
                                    <tr key = {employee.id}>
                                        <td>{employee.firstName}</td>
                                        <td>{employee.lastName}</td>
                                        <td>{employee.emailId}</td>
                                    </tr>
                                )
                            }
                        </tbody>
                    </table>
                </div>
            </div>
        );
    }
}

export default ListEmployeeComponent;