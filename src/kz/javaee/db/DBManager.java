package kz.javaee.db;

import java.util.ArrayList;

public class DBManager {
    private static ArrayList<Tasks> tasks = new ArrayList<>();
    private static Long id = 4L;

    static{
        tasks.add(new Tasks(1L, "Create a new WEB app on Java EE","YOu need to create your own app on Java EE. At first I install a Composer on a latop. And then download a JAVA EE and push the start.", "23.10.2021", true));
        tasks.add(new Tasks(2L, "Do shores and buy grocery", "GO to the store and buy dairy and frozen products", "25.10.2021", false));
        tasks.add(new Tasks(3L, "Do all homeworks", "do exercises", "28.10.2025", true));
    }

    public static void addTask(Tasks task){
        if(task !=null ){
            task.setId(id);
            tasks.add(task);
            id++;
        }
    }

    public static Tasks getTask(Long id){

        for(Tasks t:tasks){
            if(t.getId()==id){
                return t;
            }
        }
        return null;
    }

    public static ArrayList<Tasks> getAllTasks(){
        return tasks;
    }

    public static void deleteTask(Long id){
        for(int i=0; i<tasks.size(); i++){
            if(tasks.get(i).getId().equals(id)){
                tasks.remove(i);
            }
        }
    }

    public static void updateTask(Tasks task){
        for(int i =0; i<tasks.size(); i++){
            if(tasks.get(i).getId().equals(task.getId())){
                tasks.set(i, task);
            }
        }
    }
}
