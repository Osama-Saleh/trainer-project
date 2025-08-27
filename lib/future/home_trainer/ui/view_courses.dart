import 'package:flutter/material.dart';
import 'package:trainer_project/future/home_student/data/data_source/sing_out_data_source.dart';
import 'package:trainer_project/future/home_trainer/data/data_source/home_trainer_data_source.dart';

class ViewCourses extends StatelessWidget {
  final bool? isStudent;
  const ViewCourses({super.key,this.isStudent = true});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Courses'),
         actions: [
         isStudent==true ? IconButton(
            icon: Icon(Icons.logout,
            color: Colors.red,
            ),
            onPressed: () async{
              CustomSingOutDataSource.signOut(context: context);
            },
          ): SizedBox(),
        ],
      ),
      body: SafeArea(
          child: FutureBuilder(
        future: HomeTrainerDataSource.getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return snapshot.data!.length == 0
                ? Center(
                    child: Text('No Courses get'),
                  )
                : ListView.separated(
                    itemBuilder: (context, index) {
                      var courseModel = snapshot.data![index];
                      return Card(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            spacing: 12,
                            children: [
                              Row(
                                children: [
                                  Text('name : '),
                                  Expanded(
                                      child:
                                          Text(courseModel.name ?? 'No Data'))
                                ],
                              ),
                              Row(
                                children: [
                                  Text('title : '),
                                  Expanded(
                                      child:
                                          Text(courseModel.title ?? 'No Data'))
                                ],
                              ),
                              Row(
                                children: [
                                  Text('phone : '),
                                  Text(
                                      '${courseModel.phone ?? 'No Data'}') // 'null'
                                ],
                              ),
                              Row(
                                children: [
                                  Text('price : '),
                                  Text('${courseModel.price ?? 'No Data'}')
                                ],
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                    itemCount: snapshot.data!.length);
          }
          return Center(
            child: Text('Error Connection'),
          );
        },
      )),
    );
  }
}
