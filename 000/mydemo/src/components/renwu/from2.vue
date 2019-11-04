<template>
  <div>
    <Form :ref="person" :model="person" :rules="ruleValidate" :label-width="80">
      <FormItem label="用户名" prop="name">
        <Input v-model="person.name" placeholder="Enter your name"></Input>
      </FormItem>
      <FormItem label="密码" prop="password">
        <Input v-model="person.password" placeholder="Enter your password"></Input>
      </FormItem>
        <FormItem label="时间" prop="time">
        <Input v-model="person.time" placeholder="Enter your time"></Input>
      </FormItem>
      <FormItem>
        <Button type="primary" @click="handleSubmit(person)">Submit</Button>
      </FormItem>
    </Form>
  </div>
</template>

<script>
export default {
  components: {},
  props: [],
  data() {
    return {
      ruleValidate: {
        name: [
          {
            required: true,
            message: "The name cannot be empty",
            trigger: "blur"
          }
        ],
          time: [
          {
            required: true,
            message: "The time cannot be empty",
            trigger: "blur"
          }
        ],
        password: [
         {
           required: true,
            message: "The password cannot be empty",
            trigger: "blur"
          }
        ]
      },
      person: {
        name: "",
        time: "",
        password:''
      }
    };
  },
  watch: {},
  computed: {},
  methods: {
    handleSubmit(person) {
      this.$refs[person].validate(valid => {
        if (valid) {
          this.$emit("getPerson", person);
          this.$Message.success("Success!");
        } else {
          this.$Message.error("Fail!");
        }
      });
    },
    // addPerson(person) {
      
    // }
  },

  created() {},
  mounted() {}
};
</script>
<style scoped>
</style>