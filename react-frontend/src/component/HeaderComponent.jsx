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
                    <div><a href="/" className="navbar-brand">Online Portfolio</a></div>
                    </nav>
                </header>
            </div>
        );
    }
}

export default HeaderComponent;