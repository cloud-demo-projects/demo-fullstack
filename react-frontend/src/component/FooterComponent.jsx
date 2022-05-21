import React, { Component } from 'react';

class FooterComponent extends Component {

    //Constructor
    constructor(props) {
        super(props)

        this.state = {
        }
    }

    render() {
        return (
            <div>
                <footer className = "footer">
                    <span className="text-muted">All Rights Reserved 2022@nipunbahri.com</span>
                </footer>
            </div>
        );
    }
}

export default FooterComponent;

