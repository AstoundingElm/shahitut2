#include <stdio.h>
#include <stdlib.h>
#include <stdint.h>
#include <string.h>
#include <vulkan/vulkan.h>
#include <stdbool.h>
#define MAX_DEVICES 2
#define TUT1_MAX_QUEUE_FAMILY 10

typedef struct 
{
	VkPhysicalDevice physical_device;
	VkPhysicalDeviceProperties properties;
	VkPhysicalDeviceFeatures features;
	VkPhysicalDeviceMemoryProperties memories;

	VkQueueFamilyProperties queue_families[TUT1_MAX_QUEUE_FAMILY];
	uint32_t queue_family_count;
	bool queue_families_incomplete;
}tut1_physical_device;

typedef struct 
{
	VkQueueFlags qflags;
	VkCommandPool pool;
	VkQueue *queues;
	uint32_t queue_count;
	VkCommandBuffer *buffers;
	uint32_t buffer_count;
	
}tut2_commands;

typedef struct 
{
VkDevice device;
tut2_commands *command_pools;
uint32_t command_pool_count;

}tut2_device;

VkInstance  instance;
tut1_physical_device devo;
//tut1_physical_device phy_devs[MAX_DEVICES];
tut2_device devs[MAX_DEVICES];

void createInstance123(){

VkApplicationInfo app_info = {
		.sType = VK_STRUCTURE_TYPE_APPLICATION_INFO,
		.pApplicationName = "Vulkan Tutorial",
		.applicationVersion = 0x010000,
		.pEngineName = "Vulkan Tutorial",
		.engineVersion = 0x010000,
		.apiVersion = VK_API_VERSION_1_0,
	};

VkInstanceCreateInfo info = {
		.sType = VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO,
		.pApplicationInfo = &app_info,
	};

 vkCreateInstance(&info, NULL, &instance);

};
void tut1_enumerate_devices(VkInstance inst, tut1_physical_device * devs, uint32_t  *count)
{VkPhysicalDevice phy_devs[*count];
	
	VkResult res;

	res = vkEnumeratePhysicalDevices(inst, count, phy_devs);	

	for (uint32_t i = 0; i < *count; ++i)
	{
		devs[i].physical_device = phy_devs[i];

		
		vkGetPhysicalDeviceProperties(devs[i].physical_device, &devs[i].properties);
		vkGetPhysicalDeviceFeatures(devs[i].physical_device, &devs[i].features);
		vkGetPhysicalDeviceMemoryProperties(devs[i].physical_device, &devs[i].memories);

		
		uint32_t qfc = 0;
		devs[i].queue_family_count = TUT1_MAX_QUEUE_FAMILY;
		vkGetPhysicalDeviceQueueFamilyProperties(devs[i].physical_device, &qfc, NULL);
		vkGetPhysicalDeviceQueueFamilyProperties(devs[i].physical_device, &devs[i].queue_family_count, devs[i].queue_families);

		devs[i].queue_families_incomplete = devs[i].queue_family_count < qfc;
	}

}


void tut2_get_dev(tut1_physical_device *phy_dev, tut2_device *dev, VkQueueFlags qflags,
		VkDeviceQueueCreateInfo queue_info[], uint32_t *queue_info_count)
{
	
	VkResult res;
	*dev = ( tut2_device){0};

	uint32_t max_queue_count = *queue_info_count;
	*queue_info_count = 0;

	uint32_t max_family_queues = 0;
	for (uint32_t i = 0; i < phy_dev->queue_family_count; ++i)
		if (max_family_queues < phy_dev->queue_families[i].queueCount)
			max_family_queues = phy_dev->queue_families[i].queueCount;
	float queue_priorities[max_family_queues];
	memset(queue_priorities, 0, sizeof queue_priorities);

	for (uint32_t i = 0; i < phy_dev->queue_family_count && i < max_queue_count; ++i)
	{
		
		if ((phy_dev->queue_families[i].queueFlags & qflags) == 0)
			continue;

		queue_info[(*queue_info_count)++] = (VkDeviceQueueCreateInfo){
			.sType = VK_STRUCTURE_TYPE_DEVICE_QUEUE_CREATE_INFO,
			.queueFamilyIndex = i,
			.queueCount = phy_dev->queue_families[i].queueCount,
			.pQueuePriorities = queue_priorities,
		};
	}

	if (*queue_info_count == 0)
	{
		
	}


	VkDeviceCreateInfo dev_info = {
		.sType = VK_STRUCTURE_TYPE_DEVICE_CREATE_INFO,
		.queueCreateInfoCount = *queue_info_count,
		.pQueueCreateInfos = queue_info,
		.pEnabledFeatures = &phy_dev->features,
	};


	 res = vkCreateDevice(phy_dev->physical_device, &dev_info, NULL, &dev->device);

}

void tut2_get_commands(tut1_physical_device *phy_dev,  tut2_device *dev, VkDeviceQueueCreateInfo queue_info[], uint32_t queue_info_count)
{
	
	VkResult res;

	dev->command_pools = malloc(queue_info_count * sizeof *dev->command_pools);
	if (dev->command_pools == NULL)
	{
		
	}

	for (uint32_t i = 0; i < queue_info_count; ++i)
	{
		tut2_commands *cmd = &dev->command_pools[i];
		*cmd = ( tut2_commands){0};

		
		cmd->qflags = phy_dev->queue_families[queue_info[i].queueFamilyIndex].queueFlags;

		VkCommandPoolCreateInfo pool_info = {
			.sType = VK_STRUCTURE_TYPE_COMMAND_POOL_CREATE_INFO,
			.flags = VK_COMMAND_POOL_CREATE_RESET_COMMAND_BUFFER_BIT,
			.queueFamilyIndex = queue_info[i].queueFamilyIndex,
		};

		
		res = vkCreateCommandPool(dev->device, &pool_info, NULL, &cmd->pool);
		
		if (res < 0)
			
		++dev->command_pool_count;

		cmd->queues = malloc(queue_info[i].queueCount * sizeof *cmd->queues);
		cmd->buffers = malloc(queue_info[i].queueCount * sizeof *cmd->buffers);
		if (cmd->queues == NULL || cmd->buffers == NULL)
		{
		
		for (uint32_t j = 0; j < queue_info[i].queueCount; ++j)
			vkGetDeviceQueue(dev->device, queue_info[i].queueFamilyIndex, j, &cmd->queues[j]);
		cmd->queue_count = queue_info[i].queueCount;

		VkCommandBufferAllocateInfo buffer_info = {
			.sType = VK_STRUCTURE_TYPE_COMMAND_BUFFER_ALLOCATE_INFO,
			.commandPool = cmd->pool,
			.commandBufferCount = queue_info[i].queueCount,
		};

	
		res = vkAllocateCommandBuffers(dev->device, &buffer_info, cmd->buffers);
		
		if (res)
	

		cmd->buffer_count = queue_info[i].queueCount;
	}

}
}

void tut2_cleanup( tut2_device *dev)
{

	vkDeviceWaitIdle(dev->device);

	for (uint32_t i = 0; i < dev->command_pool_count; ++i)
	{
		free(dev->command_pools[i].queues);
		free(dev->command_pools[i].buffers);
		vkDestroyCommandPool(dev->device, dev->command_pools[i].pool, NULL);
	}
	free(dev->command_pools);

	vkDestroyDevice(dev->device, NULL);

	*dev = ( tut2_device){0};
};

int main(int argc, char **argv)
{	
	uint32_t dev_count = MAX_DEVICES;

	createInstance123();
	tut1_physical_device devo[MAX_DEVICES];
	tut1_enumerate_devices(instance , devo, &dev_count);
	
	for (uint32_t i = 0; i < dev_count; ++i)
	{
		
	}

	printf("Got queues and command buffers, it was nice.\n");



}
