<script setup lang="ts">


import { useEmployeeStore } from '~~/stores/employees';


const employeeStore = useEmployeeStore();




 let employees = await employeeStore.getEmployees(10,0,'updated_at~desc');
 console.log(employees);

 const headers = ['name', 'comapny name', 'registered at', 'updated at']

 const generateColumns = (length = headers.length, prefix = 'column-', props?: any) =>
  Array.from({ length }).map((_, columnIndex) => ({
    ...props,
    key: `${prefix}${columnIndex}`,
    dataKey: `${prefix}${columnIndex}`,
    title: `${headers[columnIndex]}`, // change here
    width: 250,
  }))

  const generateData = (    
  columns: ReturnType<typeof generateColumns>,
  length = employees.length,
  prefix = 'row-'
) =>

  Array.from({ length }).map((_, rowIndex) => {
    return columns.reduce(
      (rowData, column, columnIndex) => {
        // rowData[column.dataKey] = `Row ${rowIndex} - Col ${columnIndex} ${employees[rowIndex].id}`
        // change here
        rowData['column-0'] = `${employees[rowIndex].first_name}`
        rowData['column-1'] = `${employees[rowIndex].email}`
        rowData['column-2'] = `${employees[rowIndex].created_at}`
        rowData['column-3'] = `${employees[rowIndex].updated_at}`
        return rowData
      },
      {
        id: `${prefix}${rowIndex}`,
        parentId: null,
      }
    )

  })

 
let columns = generateColumns()
let data = generateData(columns)

const currentPage = ref(1);
const rowsPerPage = ref(10);

const handleSizeChange = (val:any) => {
      currentPage.value = 1;
      console.log(`每页 ${val} 条`);
    };

const handleCurrentChange = async(val:any) => {
  currentPage.value = val;
  await getList();

  
  console.log(`当前页: ${val}`);
};

const newEmployeeList = [
  {
            
            "id": 279,
            "created_at": "2022-12-27T10:16:59+09:00",
            "updated_at": "2023-01-11T15:56:55+09:00",
            "first_name": "企業管理者",
            "last_name": "コンソール",
            "email": "Monitor@everforth.co.jp",
          
  },
  {
            
            "id": 280,
            "created_at": "2022-12-27T10:16:59+09:00",
            "updated_at": "2023-01-11T15:56:55+09:00",
            "first_name": "企業管理者",
            "last_name": "コンソール",
            "email": "ringEF@everforth.co.jp",
          
  },
  {
            
            "id": 281,
            "created_at": "2022-12-27T10:16:59+09:00",
            "updated_at": "2023-01-11T15:56:55+09:00",
            "first_name": "企業管理者",
            "last_name": "コンソール",
            "email": "ngEF@everforth.co.jp",
          
  },
  {
            
            "id": 279,
            "created_at": "2022-12-27T10:16:59+09:00",
            "updated_at": "2023-01-11T15:56:55+09:00",
            "first_name": "企業管理者",
            "last_name": "コンソール",
            "email": "MonitoringE",
          
  },



];


const getList = async (pageNumber = currentPage) =>{
  console.log(`tttttttttttt  ${currentPage.value}`)
  
  employees = await employeeStore.getEmployees(currentPage.value,0,'updated_at~desc');
  console.log('==============================');
  columns = generateColumns()
  data = generateData(columns, employees.length)

 
  console.log(employees);

  
};


</script>

<template>
  <NuxtLayout>    
    <v-card height="200px" style="margin: 5px;"></v-card>

    <el-pagination
      v-model:current-page="currentPage"
      v-model:page-size="rowsPerPage"
      :page-sizes="[10, 50, 100]"
      :small="false"
      :disabled="false"
      :background="true"
      layout="total, sizes, prev, pager, next, jumper"
      :total="50"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
    />

        <el-table-v2
        
        
        :columns="columns"
        :data="data"
        :width="1000"
        :height="400"
        fixed
        
        />
    {{ currentPage }}
    {{ rowsPerPage }}
    
    <el-pagination
      v-model:current-page="currentPage"
      v-model:page-size="rowsPerPage"
      :page-sizes="[10, 50, 100]"
      :small="false"
      :disabled="false"
      :background="true"
      layout="total, sizes, prev, pager, next, jumper"
      :total="50"
      @size-change="handleSizeChange"
      @current-change="handleCurrentChange"
     
      
    />


  </NuxtLayout>  
</template>



