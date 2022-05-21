import axios from "axios";

class SkillService {

    getSkills() {
        // const agent = new https.Agent({  
        //     rejectUnauthorized: false
        // });

        console.log(process.env.REACT_APP_SKILL_API_BASE_URL);
        return axios.request({method: "GET",
                              url: process.env.REACT_APP_SKILL_API_BASE_URL,
                              crossDomain: true})
    }

}

export default new SkillService()