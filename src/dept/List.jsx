import React from 'react';
import  { sprintf } from 'sprintf-js';
import sleep from 'es7-sleep';
import { Link } from 'react-router-dom';;
import withRouter from "./withRouter.js"

 
 
	 

class List extends React.Component {
	
	constructor(){
		super();
	 	console.log("constructor");
	 	this.init();
	}
	
	/*componentDidMount(){
		console.log("componentDidMount..");
		this.init();
	}*/
	
	async init(){
		let response = await fetch('/rest/dept')
		let json = await response.json();
		
		
		this.state.data = json.data;
		console.log(this.state.data);	
		this.forceUpdate();
	}
	state = {
		data:[]
	}
	
	render() {
		return(
			<>
				<div className='div'>
				<h1 style={{
					marginLeft:50,
				    display:'inline-block',
				    marginRight:20
				    }}>부서목록</h1>
				<Link to="/rest/dept/insert" className='link'>부서추가</Link>
				<table>
					<thead>
					<tr>
						<th>deptno</th>
						<th>dname</th>
						<th>loc</th>
						<th>수정</th>
						<th>삭제</th>
					</tr>	
					</thead>
					<tbody>
					{
						this.state.data.map(dept =>
							<tr key={dept.deptno}>
								<td>{dept.deptno}</td>
								<td>{dept.dname}</td>
								<td>{dept.loc}</td>
								<td><Link to="/rest/dept/update" state ={{dept: dept}}>수정</Link></td>
								<td><Link to="/rest/dept/delete" state={{dept: dept}}>삭제</Link></td>
							</tr>
						)
					}
					</tbody>
				</table>
				</div>
			</>
	)				
 }
}

export default withRouter(List);
 