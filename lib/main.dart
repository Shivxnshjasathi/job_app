import 'package:flutter/material.dart';

void main() {
  runApp(JobDetailsApp());
}

class JobDetailsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Job Details App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: JobListScreen(),
    );
  }
}

class Job {
  final String title;
  final String description;

  Job(this.title, this.description);
}

class JobListScreen extends StatelessWidget {
  final List<Job> jobs = [
    Job('Software Engineer', 'Developing software applications.'),
    Job('Graphic Designer', 'Creating visual designs and layouts.'),
    Job('Marketing Specialist', 'Promoting products and services.'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job List'),
      ),
      body: ListView.builder(
        itemCount: jobs.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(jobs[index].title),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => JobDetailScreen(job: jobs[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class JobDetailScreen extends StatelessWidget {
  final Job job;

  JobDetailScreen({required this.job});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Job Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              job.title,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(job.description),
          ],
        ),
      ),
    );
  }
}
