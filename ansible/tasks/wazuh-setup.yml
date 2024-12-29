- name: Setup Wazuh Server
  hosts: wazuh-server
  become: true
  tasks:
    # Task 1: Copying script to server
    - name: Copying script to server
      copy:
        src: ../scripts/wazuh-server-setup.sh # Fixed the typo in the path
        dest: /home/ubuntu/wazuh-server-setup.sh
        mode: "0755"

    # Task 2: Running the setup script
    - name: Setting up Wazuh server. Please wait ......
      shell: /home/ubuntu/wazuh-server-setup.sh
      register: wazuh_script_output
      async: 1200
      poll: 0

    # Task 3: Monitoring the script execution
    - name: Output of Wazuh server
      async_status:
        jid: "{{ wazuh_script_output.ansible_job_id }}"
      register: wazuh_job_result
      until: wazuh_job_result.finished
      retries: 120
      delay: 5

    # Task 4: Displaying formatted output
    - name: Formatted Output
      debug:
        msg:
          - "STDOUT: {{ wazuh_job_result.stdout | regex_replace('\\x1b\\[[0-9;]*m', '') | default('No stdout available') }}"
          - "STDERR: {{ wazuh_job_result.stderr | regex_replace('\\x1b\\[[0-9;]*m', '') | default('No stderr available') }}"

    # Task 5: Removing script from the server
    - name: Removing script from server
      file:
        path: /home/ubuntu/wazuh-server-setup.sh
        state: absent
