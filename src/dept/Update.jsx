import React from "react";
import withRouter from "./withRouter";
import { Link } from "react-router-dom";


class Update extends React.Component{
	
	constructor() {
		super();
	}
	
	componentDidMount(){
		this.state.dept = this.props.location.state.dept;
		console.log(this.state.dept);
		this.forceUpdate();
	}
	
	onChange(e) {
		this.state.dept[e.target.name]=e.target.value;
		this.forceUpdate();
	}
	
	async onSubmit(e) {
		e.preventDefault();
		
		let response = await fetch('/rest/dept',{
			method:'PUT',
			headers: {
				'Content-Type':'application/json'
			},
			body:JSON.stringify(this.state.dept)
		})
		
		if(response.ok){
			alert("부서수정성공")
			this.props.navigate('/rest/dept')
		}else {
			let json = await response.json();
			alert("부서수정 실패!" + this.message);
		}
		 
	}
	
	state = {
		dept: {
			deptno: "",
			dname: "",
			loc: "",
		}
	}
	
	render() {
		return(
			<>
			<div className="div"> 
		 	<h1 className="h1">부서수정</h1>
			<Link to="/rest/dept" className="link">목록으로 이동</Link>
			<form onSubmit={event => this.onSubmit(event)}>
				<fieldset>
					<legend>부서번호</legend>
					<input readOnly value={this.state.dept.deptno}/>
				</fieldset>
				<fieldset>
					<legend>부서이름</legend>
					<input name="dname" value={this.state.dept.dname == null ? "" :this.state.dept.dname} maxLength={35} onChange={event => this.onChange(event)} required/>
				</fieldset>
				<fieldset>
					<legend>위치</legend>
					<input name="loc" value={this.state.dept.loc == null? "" : this.state.dept.loc} maxLength={13} onChange={event => this.onChange(event)}/>
					</fieldset>
						<input type="submit" value="부서수정" className="submit"/>
					
			</form>
			</div>
			</>
		)
	}
}

export default withRouter(Update);