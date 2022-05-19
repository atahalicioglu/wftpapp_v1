class Job {
  final String job_date;
  final String job_shift;
  final String job_description;

  Job(this.job_date, this.job_shift, this.job_description);

  Job.fromJSON(Map<dynamic, dynamic> json):
      job_date = json['Job Date'] as String,
      job_shift = json['Job Shift'] as String,
      job_description = json['Job Description'] as String;

  Map<dynamic, dynamic> toJson() => <dynamic, dynamic>{
    'Job Date' : job_date,
    'Job Shift' : job_shift,
    'Job Description' : job_description
  };
}