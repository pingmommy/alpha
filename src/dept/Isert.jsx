import React from "react";
import { Link } from "react-router-dom";
import withRouter from "./withRouter";

class Insert extends React.Component{
	
	async onSubmit(e) {
		console.log("submit..");
		e.preventDefault();
		/*다른 url로 서버로 보내는 게 디폴트 기능이라서 디폴트를 막음.*/
		
		console.log(this.state.dept)
		
		let response = await fetch('/rest/dept',{
			method :"POST",
			headers :{
				'Content-Type':'application/json'
			},
			body:JSON.stringify(this.state.dept)
		});
		
		if(response.ok){
			alert("부서추가성공! 부서목록으로 이동합니다.");
			this.props.navigate("/rest/dept");
		}else{
			let error = await response.json();
			alert("부서추가실패"+ error.message);
		}
		
		let result = await response.json();
		
		console.log(result);
	}
	
	state = {
		dept : {}
	}
	
	
	render(){
	 return(
		 <>
		 <h1>부서추가</h1>
		 <hr/>
		 <Link to="/rest/dept">목록으로이동</Link>
		 <hr/>
		 <form onSubmit={event =>this.onSubmit(event)}>
		 	<fieldset>
		 		<legend>deptno</legend>
		 		<input type="number" required min={0} max={99} onChange={event =>this.state.dept.deptno = event.target.value}/>
		 	</fieldset>
		 	<fieldset>
		 		<legend>dname</legend>
		 		<input type="text" required maxLength={35} onChange={event =>this.state.dept.dname = event.target.value}/>
		 	</fieldset>
		 	<fieldset>
		 		<legend>dname</legend>
		 		<input type="text" maxLength={13} onChange={event => this.state.dept.loc = event.target.value}/>
		 	</fieldset>
		 	<fieldset>
		 	 	<input type="submit" value="부서추가"/>
		 	</fieldset>
		 </form>
		 </>
	 )	
	}
}

export default withRouter(Insert);