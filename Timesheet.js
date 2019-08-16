

class Timesheet extends React.Component
{
	constructor(props)
	{
		super(props);
		this.state = {"site_code":"", "contractor_name":"", "date":null, labor_info:[], machine_info:[]}
	}
	
	componentDidMount()
	{
		this.addLaborRow();
		this.addMachineRow();
		console.log(this.props.machine_opt);
	}
	
	render()
	{
		let labor_rows_to_render = this.state.labor_info.map((elem) => 
			<TimeSheetRow tsr={elem} label1={"Labor Code: "} label2={"Hours Worked: "} dd_opts={this.props.labor_opt} />);
		let machine_rows_to_render = this.state.machine_info.map((elem) => 
			<TimeSheetRow tsr={elem} label1={"Machine Code: "} label2={"Hours Used: "} dd_opts={this.props.machine_opt} />);
		return(
			<div style={{padding:"30px", margin:"0px", display:"block"}}>
				<div style={{marginBot:"10px", display:"inline-block"}}>
					<form style={{height:"30px", float:"left"}} onSubmit={function (e){e.preventDefault();}}>
						Site Code:
						<input style={{paddingRight:"5px", marginLeft:"10px", marginRight:"10px"}} type="text" 
						onChange={e => this.handleChangeVal("site_code", e)}
						/>
					</form>
					<form style={{height:"30px", float:"left"}} onSubmit={function (e){e.preventDefault();}}>
						Contractor Name:
						<input type="text" style={{marginLeft:"10px", marginRight:"10px"}}
						onChange={e => this.handleChangeVal("contractor_name", e)}
						/>
					</form>
					<form style={{height:"30px", float:"left"}} onSubmit={function (e){e.preventDefault();}}>
						Date:
						<input type="date" style={{marginLeft:"10px"}}
						onChange={e => this.handleChangeVal("date", e)}
						/>
					</form>
				</div>
				<div id="labor_input_container" style={{boxSizing:"border-box", backgroundColor:"#EEEEEE", 
					borderStyle:"solid", borderColor:"#AAAAAA", margin:"0px", padding:"0px"}}>
					<p style={{fontSize:"20px"}}>Labor Entry</p>
					<ul style={{listStyleType:"none", margin:"5px"}}>
						{labor_rows_to_render}
					</ul>
					<button style={{position:"static"}} onClick={this.addLaborRow}>Add More</button>		
				</div>	
				<div id="machine_input_container" style={{boxSizing:"border-box", backgroundColor:"#EEEEEE", 
					borderStyle:"solid", borderColor:"#AAAAAA", marginTop:"10px", padding:"0px"}}>
					<p style={{fontSize:"20px"}}>Machine Entry</p>
					<ul style={{listStyleType:"none", margin:"5px"}}>
						{machine_rows_to_render}
					</ul>
					<button style={{position:"static"}} onClick={this.addMachineRow}>Add More</button>	
				</div>	
				<button style={{position:"relative", left:"0px", marginTop:"10px"}} onClick={this.handleSubmit}>Submit</button>
			</div>
		)
	}
	
	addLaborRow = () =>
	{
		
		this.setState({
		  labor_info: [...this.state.labor_info, {"code":null, "hours":null, "total":null}]
		})
		console.log("adding a labor row")
	}
	addMachineRow = () =>
	{
		
		this.setState({
		  machine_info: [...this.state.machine_info, {"code":null, "hours":null, "total":null}]
		})
		console.log("adding a machine row")
	}
	
	handleChangeVal(key, e)
	{
		e.preventDefault();
		if(key === "site_code")
			this.setState({"site_code":e.target.value})
		else if(key === "contractor_name")
			this.setState({"contractor_name":e.target.value})		
		else if(key === "date")
			this.setState({"date":e.target.value})
	
	}
	
	handleSubmit = async (e) =>
	{
		e.preventDefault();
		let labor_to_send = [];
		for(let i=0;i<this.state.labor_info.length;i++)
		{
			let elem = this.state.labor_info[i];
			if(elem["code"] && elem["hours"] && elem["total"])
			{
				elem["total"] = elem["total"].toFixed(2);
				var found = this.props.labor_opt.find(function(element) {
					  return element["name"] === elem["code"];
					});
				if(found)
				{
					elem["hours"] = parseFloat(elem["hours"]).toFixed(2);
					elem["id"] = found["id"];
					labor_to_send.push(elem);
					console.log(elem);
					console.log("valid");
				}
			}
		}
		let machines_to_send = [];
		for(let i=0;i<this.state.machine_info.length;i++)
		{
			let elem = this.state.machine_info[i];
			if(elem["code"] && elem["hours"] && elem["total"])
			{
				elem["total"] = elem["total"].toFixed(2);
				var found = this.props.machine_opt.find(function(element) {
					  return element["name"] === elem["code"];
					});
				if(found)
				{
					elem["hours"] = parseFloat(elem["hours"]).toFixed(2);
					elem["id"] = found["id"];
					machines_to_send.push(elem);
					console.log(elem);
					console.log("valid");
				}
			}
		}
		
		if(this.state["date"] && this.state["contractor_name"] && this.state["site_code"])
		{
		
			let params_ = {"machines":machines_to_send, "labor":labor_to_send,
					"date":this.state["date"].toString(),
					"contractor_name":this.state["contractor_name"],
					"site_code":this.state["site_code"],
					}
			
			console.log(params_);
			
			let response = await fetch("/saveTimesheet", 
					{
						method: 'POST',
						headers: {'Content-Type': 'application/json'},
						body: JSON.stringify(params_)
						
					}).catch(error => {
						return null;
					});
			window.location = "/userhome";
		}
	
		
	}	
	
}



class TimeSheetRow extends React.Component
{
	constructor(props)
	{
		super(props);
		this.state = {"total":this.props.tsr["total"]};
	}
	
	render()
	{
		let tsr = this.props.tsr;
		let label1 = this.props.label1;
		let label2 = this.props.label2;
		let dd_opts = this.props.dd_opts;
		
		let dd_elements = dd_opts.map((elem) => <option value={elem["name"]}>{elem["name"]}</option>);
		return(
			<React.Fragment>
			<li>
				<div style={{padding:"0px", float:"none"}}>
					<p style={{float:"left"}}>{label1}</p>
					<select style={{float:"left", padding:"1px", marginLeft:"10px", marginRight:"10px"}} 
						onChange={(event) =>{tsr["code"] = event.target.value; 
							this.calcTotal(tsr["code"], tsr["hours"])}}>
						<option value={null}></option>
						{dd_elements}
					</select>
					<form style={{float:"left"}} onSubmit={function (e){e.preventDefault();}}>
						{label2}
						<input style={{paddingRight:"5px", marginLeft:"10px", marginRight:"10px"}} type="number" 
						onChange={e => {tsr["hours"] = e.target.value; 
							this.calcTotal(tsr["code"], tsr["hours"])}}
						/>
					</form>
					<form style={{height:"30px"}} onSubmit={function (e){e.preventDefault();}}>
						Total:
						<input type="number" value={this.state["total"]} style={{marginLeft:"10px"}}
						onChange={e => {}}
						/>
					</form>
				</div>
			</li>
			
			</React.Fragment>
		)
	}
	
	calcTotal = (name, hours) =>
	{
		let rate = 0;
		for(let i=0;i<this.props.dd_opts.length;i++)
		{
			if(this.props.dd_opts[i]["name"] == name)
				rate = this.props.dd_opts[i]["rate"];
		}
		this.props.tsr["total"] = hours * rate;
		this.setState({"total":hours*rate});
	}
}





ReactDOM.render(
	React.createElement(Timesheet, {labor_opt:labor_options_list, machine_opt:machine_options_list}),
	document.getElementById('timesheetRoot')
);



