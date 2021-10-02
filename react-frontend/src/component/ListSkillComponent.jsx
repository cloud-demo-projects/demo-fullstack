import React, { Component } from 'react';
import SkillService from '../service/SkillService';

class ListSkillComponent extends Component {

    //Constructor
    constructor(props) {
        super(props)

        this.state = {
            skills: []
        }
    }

    //Best place to make REST calls
    componentDidMount(){
        SkillService.getSkills().then((res) => {
            this.setState({ skills: res.data});
        });
    }

    //Rendering the component
    render() {
        return (
            <div>                
                <h2 className="text-center">Skill List</h2>
                <div className="row">
                    <table className="table table-stripped table-bordered">
                        <thead>
                            <tr>
                                <th>Skill Type</th>
                                <th>Skill Name</th>
                                <th>Skill Proficiency</th>
                                <th>Actions</th>
                            </tr>
                        </thead>

                        <tbody>
                            {
                                this.state.skills.map(
                                    skill =>
                                    <tr key = {skill.id}>
                                        <td>{skill.skillType}</td>
                                        <td>{skill.skillName}</td>
                                        <td>{skill.skillProficiency}</td>
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

export default ListSkillComponent;