import React from "react";
import withRouter from "./withRouter";
import { Link } from "react-router-dom";

class Delete extends React.Component{
	
	componentDidMount(){
		this.state.dept =  this.props.location.state.dept;
		this.forceUpdate();
	}
	
	state ={
		dept:{
			deptno: "",
			dname: "",
			loc: "",
		}
	}
	
	async onSubmit(e){
		e.preventDefault();
		console.log (this.state.dept);
		
		let response = await fetch('/rest/dept',{
			method : 'DELETE',
			headers:{
				'Content-Type':'application/json',
			},
			body:JSON.stringify(this.state.dept)
		});
		
		if(response.ok){
			alert('부서삭제 성공! 부서목록으로 이동합니다.');
			this.props.navigate('/rest/dept');
		}else{
			let json = await response.json();
			alert('부서 삭제 실패'+ json.message);
		}
	}
	
	
	render() {
		return (
			<>
			<div className="div"> 
		 	<h1 className="h1">부서삭제</h1>
		
			<Link to="/rest/dept" className="link">목록으로 이동</Link>
			<form onSubmit={event => this.onSubmit(event)}>
				<fieldset>
					<legend>부서번호</legend>
					<input readOnly value={this.state.dept.deptno}/>
				</fieldset>
				<fieldset>	
					<legend>부서이름</legend>
					<input name="dname" value={this.state.dept.dname} disabled/>
				</fieldset>	
				<fieldset>	
					<legend>지역</legend>
					<input name="loc" value={this.state.dept.loc} disabled/>
				</fieldset>
					<input type="submit" value="부서삭제" className="submit"/>
				
			</form>
			</div>
			</>
		)
	}
}

export default withRouter(Delete);