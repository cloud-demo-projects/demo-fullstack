import React, { Component } from 'react';
import profilepic from '../profilepic.jpg';

class WelcomeComponent extends Component {

    //Constructor
    constructor(props) {
        super(props)

        this.state = {
                       
        }
    }

    render() {
        return (
            <div>
                <header>
                    <nav className="text-center">
                        <div> <br/><img src={profilepic} alt="profilepic" />
                            <h4>Welcome To My Online Portfolio</h4><br/>
                            I am an expat from India living here in Netherlands now for close to four years. I am a certified cloud 
                            engineer with 12+ years of overall IT experience including 4+ years in cloud mainly Azure including 
                            automation, IaC, CI/CD, containers, kubernets, cloud native development & migration
                            experience. Hands on experience in cloud design best practices and
                            patterns to build secure, highly scalable, fault tolerant and resilient
                            solutions. <br/> <br/>
                        </div>
                    </nav>
                    <nav className="text-center">
                        <div><a href="/skills" className="">My Skills</a></div>
                        <div><a href="https://github.com/BahriNipun" rel="noopener noreferrer" target="_blank">My Github Profile</a></div>
                        <div><a href="https://www.linkedin.com/in/nipun-bahri/" rel="noopener noreferrer" target="_blank">My LinkedIn Profile</a></div>
                        <div><a href="https://github.com/cloud-demo-projects" rel="noopener noreferrer" target="_blank">My Hobby Projects</a></div>
                    </nav>
                </header>
            </div>
        );
    }
}

export default WelcomeComponent;