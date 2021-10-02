import React, { Component } from 'react';

class HeaderComponent extends Component {

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
                    <nav className="navbar navbar-expand-md navbar-dark color-nav">
                    <div><a href="http://nipunbahri.com" className="navbar-brand">Skill Management System</a></div>
                    </nav>
                </header>
            </div>
        );
    }
}

export default HeaderComponent;